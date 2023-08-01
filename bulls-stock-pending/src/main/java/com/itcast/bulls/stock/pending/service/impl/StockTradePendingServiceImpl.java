package com.itcast.bulls.stock.pending.service.impl;

import com.itcast.bulls.stock.common.exception.ComponentException;
import com.itcast.bulls.stock.common.exception.constants.ApplicationErrorCodeEnum;
import com.itcast.bulls.stock.common.math.MathUtils;
import com.itcast.bulls.stock.common.utils.GlobalConstants;
import com.itcast.bulls.stock.entity.product.TradeStock;
import com.itcast.bulls.stock.entity.quote.TradeStockQuoteLast;
import com.itcast.bulls.stock.entity.trade.TradeDeal;
import com.itcast.bulls.stock.entity.trade.TradeOrder;
import com.itcast.bulls.stock.entity.trade.TradePosition;
import com.itcast.bulls.stock.entity.user.TradeAccount;
import com.itcast.bulls.stock.entity.user.TradeGroup;
import com.itcast.bulls.stock.pending.dao.biz.ITradeAccountDao;
import com.itcast.bulls.stock.pending.dao.biz.ITradeStockDao;
import com.itcast.bulls.stock.pending.dao.trade.ITradeDealDao;
import com.itcast.bulls.stock.pending.dao.trade.ITradeOrderDao;
import com.itcast.bulls.stock.pending.dao.trade.ITradePositionDao;
import com.itcast.bulls.stock.pending.service.IStockTradePendingService;
import com.itcast.bulls.stock.pending.vo.LimitPlaceOrderRequestVo;
import com.itcast.bulls.stock.struct.grpc.trade.*;
import io.seata.core.context.RootContext;
import io.seata.spring.annotation.GlobalTransactional;
import lombok.extern.log4j.Log4j2;
import net.devh.boot.grpc.client.inject.GrpcClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.Cache;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;

@Service
@Log4j2
public class StockTradePendingServiceImpl implements IStockTradePendingService {

    @Autowired
    private ITradeOrderDao tradeOrderDao;

    @Autowired
    private ITradeDealDao tradeDealDao;

    @Autowired
    private RedisCacheManager redisCacheManager;

    @Autowired
    private ITradeStockDao tradeStockDao;

    @Autowired
    private ITradeAccountDao tradeAccountDao;

    @Autowired
    private ITradePositionDao tradePositionDao;

    /**
     * 资金服务gRpc接口
     */
    @GrpcClient("grpc-finance-server")
    private StockFinanceServiceGrpc.StockFinanceServiceBlockingStub stockFinanceServiceBlockingStub;



    /**
     * 处理挂价单
     * @param request
     * @param quoteLast
     * @return
     * @throws ComponentException
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    @GlobalTransactional(timeoutMills = 5000)
    public LimitPlaceOrderRequestVo processMarketOrder(LimitPlaceOrderRequestVo request, TradeStockQuoteLast quoteLast) throws ComponentException {

        log.info(" Process in  StockTradePendingServiceImpl.processMarketOrder method. start global transaction, XID = " + RootContext.getXID());

        // 1. 获取交易账户信息
        TradeAccount tradeAccount = tradeAccountDao.getById(request.getAccountId());
        // 2. 获取股票产品信息
        TradeStock tradeStock = tradeStockDao.getById(request.getStockId());
        // 3. 生成成交记录
        TradeDeal tradeDeal = generateTradeDeal(quoteLast, request, tradeAccount, tradeStock);
        // 4. 生成持仓信息
        TradePosition tradePosition = generatePosition(tradeDeal, request, tradeAccount, tradeStock);
        // 5. 保存订单信息 (与市价单处理会有差异, 会存在部分成交的情况)
        TradeOrder tradeOrder = generateTradeOrder(tradeDeal, request,tradeAccount, tradeStock);
        // 6. 执行订单记录保存操作
        saveTradeOrder(tradeOrder);
        // 7. 执行持仓记录保存操作
        savePosition(tradePosition);
        // 8. 保存成交记录
        tradeDeal.setTradeOrderId(tradeOrder.getId());
        tradeDeal.setPositionId(tradePosition.getId());
        tradeDealDao.insert(tradeDeal);

        // 模拟异常
        if(true) {
            throw new ComponentException(ApplicationErrorCodeEnum.ACCOUNT_NOT_MATCH);
        }

        // 9. 记录处理结果信息， 如果是部分成交, 会将剩余数据计算并返回
        request.setOrderId(tradeOrder.getId());
        request.setExecVolume(request.getExecVolume() - tradeDeal.getExecVolume());

        return request;
    }



    /**
     * 检查请求价格是否匹配当前行情
     * @param request
     * @param quoteLast
     * @return
     */
    @Override
    public boolean checkMatchPrice(int direction , long execPrice, TradeStockQuoteLast quoteLast) {
        if(direction == GlobalConstants.ORDER_DIRECTION_BUY) {
            // 买方向， 请求价格大于第一档卖盘价格
            if(execPrice >= quoteLast.getPriceAsk1()) {
                return true;
            }

        }else{
            // 卖方向， 请求价格小于等于第一档买盘价格
            if(execPrice <= quoteLast.getPriceBid1()) {
                return true;
            }
        }
        return false;
    }


    /**
     * 转换深度报价
     * @param quoteLast
     * @param direction
     * @return
     */
    private Map<Long, Long> cvtDeepOffer(TradeStockQuoteLast quoteLast, int direction ){

        Map<Long, Long> results = new LinkedHashMap<Long, Long>();
        if(direction == GlobalConstants.ORDER_DIRECTION_BUY) {
            // 买方向
            results.put(quoteLast.getPriceAsk1(), quoteLast.getVolumeAsk1());
            results.put(quoteLast.getPriceAsk2(), quoteLast.getVolumeAsk2());
            results.put(quoteLast.getPriceAsk3(), quoteLast.getVolumeAsk3());
            results.put(quoteLast.getPriceAsk4(), quoteLast.getVolumeAsk4());
            results.put(quoteLast.getPriceAsk5(), quoteLast.getVolumeAsk5());

        }else{
            // 卖方向
            results.put(quoteLast.getPriceBid1(), quoteLast.getVolumeBid1());
            results.put(quoteLast.getPriceBid2(), quoteLast.getVolumeBid2());
            results.put(quoteLast.getPriceBid3(), quoteLast.getVolumeBid3());
            results.put(quoteLast.getPriceBid4(), quoteLast.getVolumeBid4());
            results.put(quoteLast.getPriceBid5(), quoteLast.getVolumeBid5());
        }

        return results;
    }


    /**
     * 获取股票产品的最新报价
     * @param stockId
     * @return
     * @throws ComponentException
     */
    @Override
    public TradeStockQuoteLast getTradeStockQuoteLast(Long stockId) throws ComponentException {

        // 从缓存获取数据
        Cache lastPriceCache = redisCacheManager.getCache(GlobalConstants.STOCK_QUOTE_LAST_PRICE_KEY);
        Cache.ValueWrapper quoteLastWrapper = lastPriceCache.get(stockId);
        if(quoteLastWrapper == null ) {
            throw new ComponentException(ApplicationErrorCodeEnum.QUOTE_LAST_PRICE_NOT_FOUND);
        }
        TradeStockQuoteLast quoteLast = (TradeStockQuoteLast) quoteLastWrapper.get();
        return quoteLast;
    }


    /**
     * 计算订单状态
     * @param needVolume
     * @param dealVolume
     * @return
     */
    private int calcOrderStatus(long initVolume, long dealVolume) {
        if(initVolume == dealVolume) {
            return GlobalConstants.ORDER_STATUS_ALL;
        }else if(initVolume > dealVolume) {
            return GlobalConstants.ORDER_STATUS_PART;
        } else{
            log.error("Process in GrpcStockDealService.calcOrderStatus method, error: dealVolume{} > initVolume{}", dealVolume, initVolume );
        }
        return GlobalConstants.ORDER_STATUS_WAIT;
    }



    /**
     *  创建交易订单
     * @param request
     * @return
     */
    @Override
    public TradeOrder createTradeOrder(LimitPlaceOrderRequestVo request) throws ComponentException {

        // 调用资金服务的接口, 获取账户的可用资金
        GetBalanceRequest getBalanceRequest = GetBalanceRequest.newBuilder().setAccountId(request.getAccountId()).build();
        GetBalanceResponse getBalanceResponse = stockFinanceServiceBlockingStub.getAccountBalance(getBalanceRequest);
        if(!GlobalConstants.STATUS_OK.equals(getBalanceResponse.getStatus())) {
            log.error("get account balance error ==> code: {}, msg: {}", getBalanceResponse.getStatus(), getBalanceResponse.getMessage());
            throw new ComponentException(ApplicationErrorCodeEnum.parseByCode(getBalanceResponse.getStatus()));
        }
       // 判断账户资金是否充足
       long balance = getBalanceResponse.getBalance();
       long needAmount = MathUtils.mul(request.getExecVolume(), request.getExecPrice());
       if(needAmount > balance) {
           throw new ComponentException(ApplicationErrorCodeEnum.PENDING_BALANCE_NOT_ENOUGH);
       }


        // 1. 创建订单对象
        TradeOrder order = new TradeOrder();
        order.setDirection(request.getDirection());
        order.setStockId(request.getStockId());
        order.setAccountId(request.getAccountId());
        // 2. 冗余股票信息
        TradeStock tradeStock = tradeStockDao.getById(request.getStockId());
        if(null != tradeStock) {
            order.setStockCode(tradeStock.getCode());
            order.setStockName(tradeStock.getName());
        }
        // 3. 冗余账户编号信息
        TradeAccount tradeAccount = tradeAccountDao.getById(request.getAccountId());
        if(null != tradeAccount) {
            order.setAccountNo(tradeAccount.getAccountNo());
        }

        // 4. 订单信息的设置
        order.setRequestPrice(request.getExecPrice());
        order.setExecPrice(0l);
        order.setExecVolume(0);
        order.setStatus(GlobalConstants.ORDER_STATUS_WAIT);
        order.setType(request.getType());
        order.setInitVolume(request.getExecVolume());
        order.setExecTime(new Date());
        // 5. 保存至数据库中
        tradeOrderDao.insert(order);
        // 6. 记录新生成的订单ID
        request.setOrderId(order.getId());
        return order;
    }

    /**
     * 生成订单记录
     * @param tradeDeal
     * @param request
     * @param tradeAccount
     * @param tradeStock
     * @return
     */
    private TradeOrder generateTradeOrder(TradeDeal tradeDeal, LimitPlaceOrderRequestVo request,
                                          TradeAccount tradeAccount, TradeStock tradeStock) {
        // 查询订单信息
        TradeOrder order = tradeOrderDao.getById(request.getOrderId());
        if(null == order) {
            // 新增订单
            order = new TradeOrder();
            order.setDirection(request.getDirection());
            order.setStockId(request.getStockId());
            order.setStockCode(tradeStock.getCode());
            order.setStockName(tradeStock.getName());
            order.setAccountId(request.getAccountId());
            order.setAccountNo(tradeAccount.getAccountNo());
            order.setRequestPrice(request.getExecPrice());
            order.setExecPrice(tradeDeal.getExecPrice());
            order.setExecVolume(tradeDeal.getExecVolume());
            order.setStatus(calcOrderStatus(request.getExecVolume(), tradeDeal.getExecVolume()));
            order.setType(request.getType());
            order.setInitVolume(request.getExecVolume());
            order.setExecTime(new Date());
        }else {
            // 更新原有订单信息
            if (order.getExecPrice() == 0) {
                // 第一次处理， 直接记录成交均价
                order.setExecPrice(tradeDeal.getExecPrice());
            } else {
                // 更新成交均价： (上一次成交均价 + 本次成交均价) / 2
                order.setExecPrice(MathUtils.divLong(order.getExecPrice() + tradeDeal.getExecPrice(), 2));
            }
            order.setExecVolume(order.getExecVolume() + tradeDeal.getExecVolume());
            order.setStatus(calcOrderStatus(order.getInitVolume(), order.getExecVolume()));
            order.setExecTime(new Date());
        }

        return order;
    }


    /**
     * 检查深度报价与请求价是否匹配
     * @param request
     * @param deepPrice
     * @return
     */
    private boolean checkMatchDeepPrice(LimitPlaceOrderRequestVo request, long deepPrice) {
        long execPrice = request.getExecPrice();
        if(request.getDirection() == GlobalConstants.ORDER_DIRECTION_BUY) {
            // 买方向
            if(execPrice>= deepPrice) {
                return true;
            }
        }else{
            // 卖方向
            if(execPrice <= deepPrice) {
                return true;
            }
        }

        return false;
    }


    /**
     * 生成成交记录
     * @param quoteLast
     * @param tradeAccount
     * @param tradeStock
     * @return
     */
    private TradeDeal generateTradeDeal(TradeStockQuoteLast quoteLast, LimitPlaceOrderRequestVo request, TradeAccount tradeAccount, TradeStock tradeStock) throws ComponentException {

        // 转换为报价深度
        Map<Long, Long> deepOffers = cvtDeepOffer(quoteLast, request.getDirection());

        // 计算公式： 均价 = （挡位1价格 * 挡位1数量 + 挡位n价格*挡位n数量） / (挡位1数量 + 挡位n数量) = 总价 / 总数
        // 成交总价
        long amount = 0;
        // 成交总数
        Long volume = 0l;
        // 记录成交数量
        long needVolume = request.getExecVolume();

        for(Map.Entry<Long, Long> deepOffer : deepOffers.entrySet() ) {
            // 校验深度报价是否匹配
            if(!checkMatchDeepPrice(request, deepOffer.getKey())) {
                continue;
            }
            // 当前挡位能够满足成交量
            if(needVolume <= deepOffer.getValue()) {
                amount += needVolume * deepOffer.getKey();
                volume += needVolume;
                needVolume = 0;
                break;
            }
            // 当前挡位不能满足成交量
            else {
                needVolume = needVolume - deepOffer.getValue();
                // 累加
                amount += deepOffer.getKey() * deepOffer.getValue();
                volume += deepOffer.getValue();
            }
        }

        // 生成成交记录
        TradeDeal deal = new TradeDeal();
        TradeGroup tradeGroup = tradeAccountDao.getTradeGroupByAccountId(request.getAccountId());
        deal.setAccountId(request.getAccountId());
        deal.setAccountNo(tradeAccount.getAccountNo());
        deal.setStockId(request.getStockId());
        deal.setStockCode(tradeStock.getCode());
        deal.setStockName(tradeStock.getName());
        deal.setStockMarket(tradeStock.getMarketNo());
        deal.setExecVolume(volume.intValue());
        deal.setExecPrice(MathUtils.divLong(amount, volume));
        deal.setExecTime(new Date());
        deal.setDirection(request.getDirection());
        deal.setCommission(MathUtils.calcCommission(amount, tradeGroup.getCommissionRate()));
        deal.setStatus(0);

        // 更新账户资金
        UpdateBalanceRequest updateBalanceRequest = UpdateBalanceRequest.newBuilder()
                .setAdjustBalance(getAdjustBalance(request.getDirection(), amount+ deal.getCommission()))
                .setAccountId(request.getAccountId()).setXid(RootContext.getXID()).build();
        UpdateBalanceResponse updateBalanceResponse = stockFinanceServiceBlockingStub.updateAccountBalance(updateBalanceRequest);
        if(!GlobalConstants.STATUS_OK.equals(updateBalanceResponse.getStatus())) {
            log.warn("update account balance error ==> code: {}, msg: {}", updateBalanceResponse.getStatus(), updateBalanceResponse.getMessage());
            throw new ComponentException(ApplicationErrorCodeEnum.parseByCode(updateBalanceResponse.getStatus()));
        }

        return deal;
    }

    /**
     * 获取额度调整金额
     * @param direction
     * @return
     */
    private long getAdjustBalance(int direction, long amount) {
        if(direction == GlobalConstants.ORDER_DIRECTION_BUY) {
            return  -amount;
        }
        return amount;
    }

    /**
     * 生成/更新持仓记录
     * @param tradeDeal
     * @param request
     * @param tradeAccount
     * @param tradeStock
     * @return
     */
    private TradePosition generatePosition(TradeDeal tradeDeal, LimitPlaceOrderRequestVo request,
                                           TradeAccount tradeAccount, TradeStock tradeStock) throws ComponentException {

        TradePosition tradePosition = tradePositionDao.getByAccountIdAndStockId(request.getAccountId(), request.getStockId());
        if(request.getDirection() == GlobalConstants.ORDER_DIRECTION_BUY) {
            // 买方向， 持仓处理
            if (null == tradePosition) {
                // 新增持仓
                tradePosition = new TradePosition();
                tradePosition.setAccountId(request.getAccountId());
                tradePosition.setAccountNo(tradeAccount.getAccountNo());
                tradePosition.setStockId(request.getStockId());
                tradePosition.setStockCode(tradeStock.getCode());
                tradePosition.setStockName(tradeStock.getName());
                tradePosition.setStockMarket(tradeDeal.getStockMarket());
                tradePosition.setCostPrice(tradeDeal.getExecPrice());
                tradePosition.setAvgPrice(tradeDeal.getExecPrice());
                tradePosition.setVolume(tradeDeal.getExecVolume());
                // 股票CFD （T+0模式）
                tradePosition.setValidSellVolume(tradeDeal.getExecVolume());
                tradePosition.setExecTime(tradeDeal.getExecTime());
                tradePosition.setStatus(0);

            } else {
                // 仓位合并处理
                // 更新成本价： (持仓成本价 * 持仓数量 + 本次成交均价 * 本次成交数量) / (持仓数量 + 本次成交数量)
                Long origiAmount = MathUtils.mul(tradePosition.getAvgPrice(), tradePosition.getVolume());
                Long curAmount = MathUtils.mul(tradeDeal.getExecPrice(), tradeDeal.getExecVolume());
                Long costPrice = MathUtils.divLong(MathUtils.add(origiAmount, curAmount), MathUtils.add(tradePosition.getVolume(), tradeDeal.getExecVolume()));
                tradePosition.setCostPrice(costPrice);
                // 更新成交均价： (上一次成交均价 + 本次成交均价) / 2
                tradePosition.setAvgPrice(MathUtils.divLong(tradePosition.getAvgPrice() + tradeDeal.getExecPrice(), 2));

                tradePosition.setVolume(tradePosition.getVolume() + tradeDeal.getExecVolume());
                tradePosition.setValidSellVolume(tradePosition.getValidSellVolume() + tradeDeal.getExecVolume());

            }
        }else {

            //卖方向持仓处理
            if(null == tradePosition) {
                throw new ComponentException(ApplicationErrorCodeEnum.NO_STOCK_POSITION_DATA);
            }
            if(tradePosition.getValidSellVolume() < request.getExecVolume()) {
                throw new ComponentException(ApplicationErrorCodeEnum.NO_ENOUGH_POSITION_VOLUME);
            }
            // 仓位合并处理
            // 更新成本价： (持仓成本价 * 持仓数量 - 本次成交均价 * 本次成交数量) / (持仓数量 - 本次成交数量)
            // 如果是足够多的盈利， 成本均价可以为负数
            Long origiAmount = MathUtils.mul(tradePosition.getAvgPrice(), tradePosition.getVolume());
            Long curAmount = MathUtils.mul(tradeDeal.getExecPrice(), tradeDeal.getExecVolume());
            Long costPrice = MathUtils.divLong(MathUtils.sub(origiAmount, curAmount), MathUtils.sub(tradePosition.getVolume(), tradeDeal.getExecVolume()));
            tradePosition.setCostPrice(costPrice);
            // 更新成交均价： (上一次成交均价 + 本次成交均价) / 2
            tradePosition.setAvgPrice(MathUtils.divLong(tradePosition.getAvgPrice() + tradeDeal.getExecPrice(), 2));

            tradePosition.setVolume(tradePosition.getVolume() - tradeDeal.getExecVolume());
            tradePosition.setValidSellVolume(tradePosition.getValidSellVolume() - tradeDeal.getExecVolume());

        }
        return tradePosition;
    }



    /**
     * 新增或更新订单信息
     * @param order
     */
    private void saveTradeOrder(TradeOrder order) {
        if(order.getId() != null ) {
            // 更新订单
            tradeOrderDao.update(order);
        }else {
            // 新增订单
            tradeOrderDao.insert(order);
        }
    }

    /**
     * 新增或更新持仓信息
     * @param tradePosition
     */
    private void savePosition(TradePosition tradePosition) {
        if(tradePosition.getId() != null) {
            tradePositionDao.update(tradePosition);
        }else {
            tradePositionDao.insert(tradePosition);
        }

    }

    /**
     * 挂单撤回处理
     * @param request
     */
    @Override
    public void recallOrder(RecallOrderRequest request) throws ComponentException{
        // 1. 根据订单ID获取订单信息
        TradeOrder order = tradeOrderDao.getById(request.getOrderId());
        if(null == order) {
            // 数据库找不到对应数据, 抛出异常
            throw new ComponentException(ApplicationErrorCodeEnum.ORDER_NOT_FOUND);
        }
        if(!order.getAccountId().equals(request.getAccountId())) {
            // 如果账户ID不一致, 抛出异常
            throw new ComponentException(ApplicationErrorCodeEnum.ACCOUNT_NOT_MATCH);
        }
        // 2. 对订单状态做判断处理, 如果是等待成交或者是部分成交的状态, 才能允许撤回
        if(order.getStatus() == GlobalConstants.ORDER_STATUS_WAIT
                || order.getStatus() == GlobalConstants.ORDER_STATUS_PART) {
            // 符合判断条件, 才可以撤回
            tradeOrderDao.updateOrderStatusById(request.getOrderId(), GlobalConstants.ORDER_STATUS_MANUAL_CANCEL);
        }else {
            // 订单已经完全成交, 不允许撤回
            throw new ComponentException(ApplicationErrorCodeEnum.ORDER_NOT_RECALL);
        }

    }

}
