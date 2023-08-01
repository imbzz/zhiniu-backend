package com.itcast.bulls.stock.deal.service;

import com.itcast.bulls.stock.common.exception.ComponentException;
import com.itcast.bulls.stock.common.exception.constants.ApplicationErrorCodeEnum;
import com.itcast.bulls.stock.common.utils.GlobalConstants;
import com.itcast.bulls.stock.deal.dao.trade.ITradeOrderDao;
import com.itcast.bulls.stock.deal.service.trade.IStockDealService;
import com.itcast.bulls.stock.entity.quote.TradeStockQuoteLast;
import com.itcast.bulls.stock.entity.trade.TradeOrder;
import com.itcast.bulls.stock.struct.grpc.trade.*;
import com.itcast.bulls.stock.struct.netty.trade.PlaceOrderResp;
import io.grpc.stub.StreamObserver;
import javafx.application.Application;
import lombok.extern.log4j.Log4j2;
import net.devh.boot.grpc.client.inject.GrpcClient;
import net.devh.boot.grpc.server.service.GrpcService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.Cache;
import org.springframework.data.redis.cache.RedisCacheManager;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@GrpcService
@Log4j2
public class GrpcStockDealService extends StockTradeDealServiceGrpc.StockTradeDealServiceImplBase {

    /**
     * 缓存管理器
     */
    @Autowired
    private RedisCacheManager redisCacheManager;

    /**
     * 交易服务业务层接口
     */
    @Autowired
    private IStockDealService stockDealService;


    @Autowired
    private ITradeOrderDao tradeOrderDao;

    /**
     * 挂单服务的grpc接口
     */
    @GrpcClient("grpc-pending-server")
    private StockPendingServiceGrpc.StockPendingServiceBlockingStub stockPendingServiceBlockingStub;

    @Override
    public void placeOrder(PlaceOrderRequest request, StreamObserver<PlaceOrderReponse> responseObserver) {
        log.info("Process in GrpcStockDealService.placeOrder method, request: " + request);
        PlaceOrderReponse response = null;
        try {
            // 1. 获取实时行情, 取得对应股票的实时报价信息
            Cache lastPriceCache = redisCacheManager.getCache(GlobalConstants.STOCK_QUOTE_LAST_PRICE_KEY);
            Cache.ValueWrapper quoteLastWrapper = lastPriceCache.get(request.getStockId());
            if(null == quoteLastWrapper) {
                throw new ComponentException(ApplicationErrorCodeEnum.QUOTE_LAST_PRICE_NOT_FOUND);
            }

            // 2. 根据下单类型判(两种类型: 一种市价委托, 另一种是限价委托), 调用相应业务逻辑处理接口
            TradeOrder tradeOrder = null;
            TradeStockQuoteLast quoteLast = (TradeStockQuoteLast)quoteLastWrapper.get();
            if(request.getType() == GlobalConstants.ORDER_TYPE_MARKET) {
                //调用交易服务的业务层接口, 处理市价单逻辑
                tradeOrder = stockDealService.processMarketOrder(request, quoteLast);
                response = PlaceOrderReponse.newBuilder().setStatus(GlobalConstants.STATUS_OK).setDealId(tradeOrder.getId()).setMessage("下单成功!").build();

            }
            // 限价委托单的处理
            else if(request.getType() == GlobalConstants.ORDER_TYPE_LIMIT) {
                // 请求价格如果符合当前的行情价格, 也要放入挂单队列处理, 因为会存在流通量不足的情况, 按市价处理只会成交部分
                // 调用挂单服务的挂单处理接口
                LimitPlaceOrderRequest.Builder orderRequest = LimitPlaceOrderRequest.newBuilder();
                BeanUtils.copyProperties(request, orderRequest);
                LimitPlaceOrderReponse limitPlaceOrderReponse = stockPendingServiceBlockingStub.limitPlaceOrder(orderRequest.build());
                response = PlaceOrderReponse.newBuilder().setStatus(limitPlaceOrderReponse.getStatus())
                        .setOrderId(limitPlaceOrderReponse.getOrderId()).setDealId(limitPlaceOrderReponse.getOrderId())
                        .setMessage(limitPlaceOrderReponse.getMessage()).build();

            }
        }catch(ComponentException e) {
            // 业务异常返回
            log.error(e.getMessage(), e);
            response = PlaceOrderReponse.newBuilder().setStatus(e.getErrorCodeEnum().getCode()).setMessage(e.getErrorCodeEnum().getMessage()).build();
        }catch(Exception e) {
            // 系统异常信息返回
            log.error(e.getMessage(), e);
            response = PlaceOrderReponse.newBuilder().setStatus(GlobalConstants.STATUS_ERROR).setMessage(e.getMessage() == null ? "null":e.getMessage()).build();
        }
        // 3. 返回封装结果给调用方
        responseObserver.onNext(response);
        responseObserver.onCompleted();
    }

    /**
     * 获取订单详情接口
     * @param request
     * @param responseObserver
     */
    @Override
    public void getOrder(GetOrderRequest request, StreamObserver<GetOrderReponse> responseObserver) {
        log.info("Process in GrpcStockDealService.getOrder, request: " + request);

        GetOrderReponse.Builder response = GetOrderReponse.newBuilder();

        try {
            // 根据订单ID获取订单详情信息
            TradeOrder order = stockDealService.getOrder(request.getOrderId());
            if(null != order) {
                BeanUtils.copyProperties(order, response, new String[]{"execTime"});
                response.setExecTime(order.getExecTime().getTime());
            }

        }catch(Exception e) {
            // 系统异常信息返回
            log.error(e.getMessage(), e);
        }

        responseObserver.onNext(response.build());
        responseObserver.onCompleted();
    }
}
