package com.itcast.bulls.stock.deal.service.trade;

import com.itcast.bulls.stock.common.exception.ComponentException;
import com.itcast.bulls.stock.entity.quote.TradeStockQuoteLast;
import com.itcast.bulls.stock.entity.trade.TradeOrder;
import com.itcast.bulls.stock.struct.grpc.trade.PlaceOrderRequest;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
public interface IStockDealService {

    /**
     * 处理市价单接口
     * @param request
     * @param quoteLast
     * @return
     * @throws ComponentException
     */
    TradeOrder processMarketOrder(PlaceOrderRequest request, TradeStockQuoteLast quoteLast) throws ComponentException;

    /**
     * <pre>
     * 获取订单详情接口
     * </pre>
     */
    public TradeOrder getOrder(Long orderId);
}
