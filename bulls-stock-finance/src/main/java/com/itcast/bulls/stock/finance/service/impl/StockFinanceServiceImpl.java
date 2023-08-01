package com.itcast.bulls.stock.finance.service.impl;

import com.itcast.bulls.stock.common.exception.ComponentException;
import com.itcast.bulls.stock.common.exception.constants.ApplicationErrorCodeEnum;
import com.itcast.bulls.stock.common.generator.DateUtils;
import com.itcast.bulls.stock.common.math.MathUtils;
import com.itcast.bulls.stock.common.utils.GlobalConstants;
import com.itcast.bulls.stock.entity.finance.TradeAccountSettlement;
import com.itcast.bulls.stock.entity.quote.TradeStockQuoteLast;
import com.itcast.bulls.stock.entity.trade.TradeDeal;
import com.itcast.bulls.stock.entity.trade.TradePosition;
import com.itcast.bulls.stock.entity.user.TradeAccount;
import com.itcast.bulls.stock.finance.dao.biz.ITradeAccountDao;
import com.itcast.bulls.stock.finance.dao.biz.ITradeAccountSettlementDao;
import com.itcast.bulls.stock.finance.dao.trade.ITradeDealDao;
import com.itcast.bulls.stock.finance.dao.trade.ITradePositionDao;
import com.itcast.bulls.stock.finance.dao.trade.ITradeQuoteDao;
import com.itcast.bulls.stock.finance.service.IStockFinanceService;
import com.itcast.bulls.stock.finance.vo.AccountOverviewVo;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.Cache;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@Service
@Log4j2
public class StockFinanceServiceImpl implements IStockFinanceService {

    /**
     * 仓位数据层接口
     */
    @Autowired
    private ITradePositionDao tradePositionDao;

    /**
     * 成交记录数据层接口
     */
    @Autowired
    private ITradeDealDao tradeDealDao;

    /**
     * 资金账户数据层接口
     */
    @Autowired
    private ITradeAccountDao tradeAccountDao;

    /**
     * Redis缓存管理器
     */
    @Autowired
    private RedisCacheManager redisCacheManager;

    /**
     * 行情服务数据层接口
     */
    @Autowired
    private ITradeQuoteDao tradeQuoteDao;

    /**
     * 账户交割单数据层接口
     */
    @Autowired
    private ITradeAccountSettlementDao tradeAccountSettlementDao;

    /**
     * 获取股票产品的最新报价
     *
     * @param stockId
     * @return
     * @throws ComponentException
     */
    private TradeStockQuoteLast getTradeStockQuoteLast(Long stockId) {

        // 从缓存获取数据
        Cache lastPriceCache = redisCacheManager.getCache(GlobalConstants.STOCK_QUOTE_LAST_PRICE_KEY);
        Cache.ValueWrapper quoteLastWrapper = lastPriceCache.get(stockId);
        TradeStockQuoteLast quoteLast = null;
        if (quoteLastWrapper != null) {
            quoteLast = (TradeStockQuoteLast) quoteLastWrapper.get();
        }

        return quoteLast;
    }


    /**
     * 计算账户总览信息
     * @param accountId
     * @return
     */
    @Override
    public AccountOverviewVo calcAccountSummary(long accountId) throws  ComponentException {
        // 1. 创建资金总览的VO返回对象
        AccountOverviewVo accountView = new AccountOverviewVo();
        // 总持仓盈亏, 公式: ∑ （现价-持仓成本价）*持仓股数。
        long positionProfits = 0l;
        // 当日持仓盈亏, 公式: ∑(原持仓当日收益= (当前仓位总数量+ 当日卖出数量-当日买入数量）* (最新价格-昨日收盘价) )+ ∑
        //(成交价格 -作收价格) * 卖出数量 + ∑ (最新价格-成交价格) * 买入数量
        long dayProfits = 0l;
        // 总市值, 公式: ∑ 股票最新价*持仓股数
        long totalMarketAmount = 0l;
        //总资产: 总市值 + 可用资金
        long totalAssets = 0l;

        // 2. 根据交易账户的ID以及时间范围, 获取今天的所有交易记录
        List<TradeDeal> dealList = tradeDealDao.getTradeDealByAcountAndTime(accountId, DateUtils.getFmtTodayStart(), DateUtils.getFmtTodayEnd());

        // 3. 根据股票产品ID做分组汇总, 便于下面的遍历处理(减少SQL的查询次数)
        Map<Long, List<TradeDeal>> groupByDeals = dealList.stream().collect(Collectors.groupingBy(TradeDeal :: getStockId));


        // 4. 根据交易账户ID, 获取所有的持仓数据信息
        List<TradePosition> positionList = tradePositionDao.getAllByAccountId(accountId);

        // 5. 遍历交易账户的持仓信息, 计算资金总览的相关信息
        for(TradePosition position : positionList) {
            // 获取最新的行情报价
            TradeStockQuoteLast quoteLast = getTradeStockQuoteLast(position.getStockId());
            if(null != quoteLast) {
                // 浮动盈亏(长整型, 保留两位小数) = (最新价 - 成本价) * 持仓数量
                long diffPrice = MathUtils.sub(quoteLast.getLastPrice(), position.getCostPrice());
                long profit = MathUtils.mul(diffPrice, position.getVolume());
                positionProfits += profit;
                // 获取昨日的收盘价
                long lastClosePrice = getStockQuoteClose(position.getStockId());
                // 单个仓位的当天成交记录的盈亏信息(获取所有单笔持仓的当日盈亏)
                dayProfits += calcTodayTradeDealProfits(groupByDeals, quoteLast, position, lastClosePrice);
                // 总市值
                totalMarketAmount += MathUtils.mul(quoteLast.getLastPrice(), position.getVolume());
            }
        }

        // 6. 将计算的结果存放到VO返回对象中
        accountView.setDayProfit(dayProfits);
        accountView.setPositionProfit(positionProfits);
        accountView.setTotalMarketAmount(totalMarketAmount);

        // 7. 计算总资产
        calcTotalAssets(accountId, accountView);

        return accountView;
    }

    /**
     * 更新账户资金余额
     * @param accountId
     * @param adjustBalance
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public long updateBalance(long accountId, long adjustBalance) throws ComponentException {
        // 1. 根据账号ID, 获取账号的信息
        TradeAccount tradeAccount = tradeAccountDao.getById(accountId);
        if(null == tradeAccount) {
            throw new ComponentException(ApplicationErrorCodeEnum.ACCOUNT_NOT_FOUND);
        }

        // 2. 检查账户的可用资金
        long balance = tradeAccount.getBalance() == null ? 0 : tradeAccount.getBalance();

        //3. 调整可用资金
        balance += adjustBalance;

        //4. 如果可用资金不足, 抛出错误提示信息
        if(balance < 0 ) {
            throw new ComponentException(ApplicationErrorCodeEnum.BALANCE_NOT_ENOUGH);
        }

        //5. 更新账户的资金信息
        tradeAccountDao.updateBalanceById(accountId, balance);

        log.info("update balance, accountId: {}, adjustBalance: {}", accountId, adjustBalance);
        return balance;
    }

    /**
     * 获取账户资金的余额
     * @param accountId
     * @return
     * @throws ComponentException
     */
    @Override
    public long getBalance(long accountId) throws ComponentException {
        // 获取账号信息
        TradeAccount tradeAccount = tradeAccountDao.getById(accountId);
        if(null == tradeAccount) {
            throw new ComponentException(ApplicationErrorCodeEnum.ACCOUNT_NOT_FOUND);
        }
        return tradeAccount.getBalance() == null ? 0 : tradeAccount.getBalance();
    }

    /**
     * 根据成交记录计算当日的浮动盈亏
     * @param groupByDeals
     * @param quoteLast
     * @param position
     * @param lastClosePrice
     * @return
     */
    private long calcTodayTradeDealProfits(Map<Long, List<TradeDeal>> groupByDeals, TradeStockQuoteLast quoteLast, TradePosition position, long lastClosePrice) {
        // 从成交记录汇总数据里面, 根据股票ID获取对应的成交记录信息
        List<TradeDeal> tradeDeals = groupByDeals.get(position.getStockId());
        // 买入收益
        long buyProfits = 0;
        long buyVolumes = 0;
        // 卖出收益
        long sellProfits = 0;
        long sellVolumes = 0;
        // 根据成交记录信息, 做遍历计算处理
        if(null != tradeDeals) {
            for(TradeDeal tradeDeal : tradeDeals) {
                if(tradeDeal.getDirection() == GlobalConstants.ORDER_DIRECTION_BUY) {
                    // 买入方向: (最新价格 - 成交价格) * 买入数量
                    long diffPrice = MathUtils.sub(quoteLast.getLastPrice(), tradeDeal.getExecPrice());
                    buyProfits += MathUtils.mul(diffPrice, tradeDeal.getExecVolume());
                    buyVolumes += tradeDeal.getExecVolume();
                }else {
                    // 卖出方向: (成交价格 - 作收价格) * 卖出数量
                    long diffPrice = MathUtils.sub(tradeDeal.getExecPrice(), lastClosePrice);
                    sellProfits += MathUtils.mul(diffPrice, tradeDeal.getExecVolume());
                    sellVolumes += tradeDeal.getExecVolume();
                }
            }
        }

        // 原持仓总数量(单笔仓位)
        long initPositionVolume = position.getVolume() + sellVolumes - buyVolumes;
        // 原持仓的当日收益(单笔仓位), 公式: (原持仓数量 * (最新价格-昨日收盘价))
        long dayProfits = MathUtils.mul(initPositionVolume, MathUtils.sub(quoteLast.getLastPrice(), lastClosePrice));
        // 当日实时持仓盈亏 = 原持仓的当日收益 + 卖出收益 + 买入收益
        dayProfits += sellProfits + buyProfits;

        return dayProfits;
    }

    /**
     * 获取股票产品的昨日收盘价
     * @param stockId
     * @return
     */
    private Long getStockQuoteClose(Long stockId) {
        // 从缓存中获取昨日收盘价信息
        Cache lastPriceCache = redisCacheManager.getCache(GlobalConstants.STOCK_QUOTE_CLOSE_PRICE_LAST_KEY);
        Cache.ValueWrapper quoteLastWrapper = lastPriceCache.get(stockId);
        // 收盘价信息
        Long closePrice = null;
        if(null != quoteLastWrapper) {
            String closePriceStr = (String) quoteLastWrapper.get();
            // 缓存数据格式:  收盘价|日期
            closePrice = Long.valueOf(closePriceStr.split("\\|")[0]);
        }else {
            // 缓存未取到, 从数据库中获取
            closePrice = tradeQuoteDao.getLastPrice(stockId, DateUtils.getLastDaytime(), DateUtils.getCurDaytime());
            if(null == closePrice) {
                // 从数据库当中没有获取的收盘价信息, 则重置为0
                closePrice = 0l;
            }
        }
        return closePrice;
    }


    /**
     * 计算总资产
     * @param accountId
     * @param accountView
     */
    private void calcTotalAssets(long accountId, AccountOverviewVo accountView) throws ComponentException {
        TradeAccount account = tradeAccountDao.getById(accountId);
        if(null == account) {
            throw new ComponentException(ApplicationErrorCodeEnum.ACCOUNT_NOT_FOUND);
        }

        long balance = account.getBalance() == null ? 0 : account.getBalance();
        accountView.setTotalMarketAmount(accountView.getTotalMarketAmount() + balance);
        accountView.setBalance(account.getBalance());
    }

    /**
     * 获取账户的交割单数据
     * @param accountId
     * @param timeStart
     * @param timeEnd
     * @return
     */
    @Override
    public List<TradeAccountSettlement> getTradeAccountSettlements(long accountId, long timeStart, long timeEnd) throws ComponentException {
        // 转换时间戳参数
        String strTimeStart = DateUtils.getFmtDateBySeconds(timeStart);
        String strTimeEnd = DateUtils.getFmtDateBySeconds(timeEnd);

        List<TradeAccountSettlement> results = tradeAccountSettlementDao.getSettlementsByTimeRange(accountId, strTimeStart, strTimeEnd);
        return results;
    }
}
