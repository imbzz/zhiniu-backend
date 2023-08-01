package com.itcast.bulls.stock.task.service.impl;

import com.itcast.bulls.stock.common.generator.DateUtils;
import com.itcast.bulls.stock.common.math.MathUtils;
import com.itcast.bulls.stock.entity.finance.TradeAccountSettlement;
import com.itcast.bulls.stock.entity.trade.TradeDeal;
import com.itcast.bulls.stock.task.cache.AccountsCache;
import com.itcast.bulls.stock.task.cache.StocksCache;
import com.itcast.bulls.stock.task.dao.biz.ITradeAccountSettlementDao;
import com.itcast.bulls.stock.task.dao.trade.ITradeDealDao;
import com.itcast.bulls.stock.task.service.IAccountSettlementService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@Service
@Log4j2
public class AccountSettlementServiceImpl implements IAccountSettlementService {

    /**
     * 成交记录的数据层接口
     */
    @Autowired
    private ITradeDealDao tradeDealDao;

    /**
     * 账户交割单的数据层接口
     */
    @Autowired
    private ITradeAccountSettlementDao tradeAccountSettlementDao;

    /**
     * 账户缓存
     */
    @Autowired
    private AccountsCache accountsCache;

    /**
     * 股票缓存
     */
    @Autowired
    private StocksCache stocksCache;


    /**
     * 生成账户的交割单数据
     * @param param
     */
    @Override
    @Transactional(rollbackFor = Exception.class, transactionManager = "bizSystemTransactionManager")
    public void generateAccountSettlement(String param) {
        // 获取指定的交易记录数据, param传递的是日期, 日期格式: 2020-05-01
        List<TradeDeal> tradeDeals = getTradeDeals(param);

        if(null != tradeDeals && !tradeDeals.isEmpty()) {
            log.info("get trade deal size : " + tradeDeals.size());
            // 遍历交易记录
            tradeDeals.stream().forEach(tradeDeal-> {
                // 处理交易记录
                processTradeDeal(tradeDeal);
            });
        }


    }

    /**
     * 根据成交记录, 生成交割单数据
     * @param deal
     */
    private void processTradeDeal(TradeDeal deal) {
        try {
            // 根据成交记录ID判断交割单是否存在
            Integer existsFlag = tradeAccountSettlementDao.checkExistsByDealId(deal.getId());
            if(null != existsFlag && existsFlag > 0) {
                log.warn("TradeAccountSettlement exists! dealId: " + deal.getId());
            }

            // 创建交割单对象, 将成交记录信息赋予交割单对象
            TradeAccountSettlement settlement = new TradeAccountSettlement();
            // 设置交易行为信息
            settlement.setAccountId(deal.getAccountId());
            settlement.setDealId(deal.getId());
            settlement.setStockId(deal.getStockId());
            settlement.setCurrency("CNY");
            settlement.setUserId(accountsCache.getUserId(deal.getAccountId()));
            settlement.setDirection(deal.getDirection());
            settlement.setStatus(0);
            settlement.setCreateTime(new Date());
            settlement.setStockCode(stocksCache.getCode(deal.getStockId()));

            // 设置交易资金信息
            settlement.setCommission(deal.getCommission());
            settlement.setTaxes(deal.getTaxes());
            settlement.setTradePrice(deal.getExecPrice());
            settlement.setTradeVolume(Long.valueOf(deal.getExecVolume()));
            settlement.setTradeTime(deal.getExecTime());
            settlement.setTradeAmount(MathUtils.mul(deal.getExecPrice(), deal.getExecVolume()));

            // 保存交割单数据
            tradeAccountSettlementDao.insert(settlement);

        }catch(Exception e) {
            log.error(e.getMessage(),e);
        }
    }


    /**
     * 获取成交记录
     * @param param
     * @return
     */
    private List<TradeDeal> getTradeDeals(String param) {
        List<TradeDeal> tradeDeals = null;
        if(StringUtils.isEmpty(param)) {
            // 获取当天交易记录
            tradeDeals = tradeDealDao.getTradeDealByTime(DateUtils.getFmtTodayStart(), DateUtils.getFmtTodayEnd());
        }else {
            // 获取指定日期的交易记录
            Timestamp[] dayRange = DateUtils.getDayRangeTimestamp(param);
            tradeDeals = tradeDealDao.getTradeDealByTime(dayRange[0], dayRange[1]);
        }
        return tradeDeals;
    }

}
