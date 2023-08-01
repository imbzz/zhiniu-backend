package com.itcast.bulls.stock.pending.service;


import com.itcast.bulls.stock.common.exception.ComponentException;
import com.itcast.bulls.stock.entity.quote.TradeStockQuoteLast;
import com.itcast.bulls.stock.entity.trade.TradeOrder;
import com.itcast.bulls.stock.pending.vo.LimitPlaceOrderRequestVo;
import com.itcast.bulls.stock.struct.grpc.trade.RecallOrderRequest;

public interface IStockTradePendingService {


    /**
     * 获取股票产品的最新报价
     * @param stockId
     * @return
     * @throws ComponentException
     */
    TradeStockQuoteLast getTradeStockQuoteLast(Long stockId) throws ComponentException;

    /**
     *  创建交易订单
     * @param request
     * @return
     */
    TradeOrder createTradeOrder(LimitPlaceOrderRequestVo request) throws ComponentException;

    /**
     * 处理市价单
     * @param request
     * @param quoteLast
     * @return
     * @throws ComponentException
     */
    LimitPlaceOrderRequestVo processMarketOrder(LimitPlaceOrderRequestVo request, TradeStockQuoteLast quoteLast) throws ComponentException;


    /**
     * 检查请求价格是否匹配当前行情
     * @param request
     * @param quoteLast
     * @return
     */
    boolean checkMatchPrice(int direction, long execPrice, TradeStockQuoteLast quoteLast);

    /**
     * 挂单撤回处理
     * @param request
     */
    public void recallOrder(RecallOrderRequest request) throws ComponentException;
}
