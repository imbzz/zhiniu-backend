package com.itcast.bulls.stock.proxy.processor;

import com.itcast.bulls.stock.common.exception.ComponentException;
import com.itcast.bulls.stock.common.utils.GlobalConstants;
import com.itcast.bulls.stock.struct.grpc.trade.*;
import com.itcast.bulls.stock.struct.netty.trade.*;
import io.netty.channel.ChannelHandlerContext;
import lombok.extern.log4j.Log4j2;
import net.devh.boot.grpc.client.inject.GrpcClient;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@Service
@Log4j2
public class StockDealProcessor extends AbstractStockProcessor implements IBaseStockProcessor{

    /**
     * grpc客户端接口
     */
    @GrpcClient("grpc-trade-server")
    private StockTradeDealServiceGrpc.StockTradeDealServiceBlockingStub stockTradeDealServiceBlockingStub;


    /**
     * 处理客户端发送的请求
     * @param channelHandlerContext
     * @param stockMessage
     */
    @Override
    public void processRequest(ChannelHandlerContext channelHandlerContext, StockMessage stockMessage) {
        switch (stockMessage.getStockHead().getRequestType()) {
            case PLACE_ORDER:
                // 下单接口的处理
                processPlaceOrder(channelHandlerContext, stockMessage);
                break;
            case GET_ORDER:
                // 获取订单详情接口
                processGetOrder(channelHandlerContext, stockMessage);
                break;
            default:
                log.error("Process in StockDealProcessor.processRequest method. ==> Not Match RequestType! " );
        }

    }

    /**
     *  处理下单请求接口
     * @param channelHandlerContext
     * @param stockMessage
     */
    private void processPlaceOrder(ChannelHandlerContext channelHandlerContext, StockMessage stockMessage) {
        ResponseMessage responseMessage = null;
        StockHeadProto.StockHead stockHead = null;
        try {

            // 1.获取请求的参数信息
            PlaceOrderData orderData = stockMessage.getPlaceOrderData();
            // 2. 构造请求参数信息
            PlaceOrderRequest request = PlaceOrderRequest.newBuilder()
                    .setAccountId(getUserAccountId(channelHandlerContext)).setDirection(orderData.getDirection()).setExecPrice(orderData.getExecPrice())
                    .setStockId(orderData.getStockId()).setType(orderData.getType()).setExecVolume(orderData.getExecVolume())
                    .build();
            // 3.调用grpc服务端下单的接口
            final PlaceOrderReponse response = stockTradeDealServiceBlockingStub.placeOrder(request);
            log.info("Process in StockDealProcessor.processRequest method. receive: " + response);

            // 4. 封装返回的报文信息
            stockHead = generateStockHead(stockMessage.getStockHead(), GlobalConstants.STATUS_OK);
            PlaceOrderResp orderResp = PlaceOrderResp.newBuilder().setDealId(response.getDealId()).build();
            responseMessage = ResponseMessage.newBuilder().setStockHead(stockHead).setPlaceOrderResp(orderResp).build();
            channelHandlerContext.writeAndFlush(responseMessage);

        }catch(ComponentException e) {
            // 封装业务异常
            log.error(e.getMessage(), e);
            stockHead = generateStockHead(stockMessage.getStockHead(), e.getErrorCodeEnum().getCode());
            responseMessage = ResponseMessage.newBuilder().setStockHead(stockHead).setMessage(e.getErrorCodeEnum().getMessage()).build();

        }catch(Exception e) {
            // 封装系统异常
            log.error(e.getMessage(), e);
            stockHead = generateStockHead(stockMessage.getStockHead(), GlobalConstants.STATUS_ERROR);
            responseMessage = ResponseMessage.newBuilder().setStockHead(stockHead).setMessage(e.getMessage()).build();

        }
    }


    /**
     * 获取下单详情接口
     * @param channelHandlerContext
     * @param stockMessage
     */
    private void processGetOrder(ChannelHandlerContext channelHandlerContext, StockMessage stockMessage) {
        ResponseMessage responseMessage = null;
        StockHeadProto.StockHead stockHead = null;
        try {
            // 获取请求参数信息
            GetOrderData getOrderData = stockMessage.getGetOrderData();
            // 构造请求信息
            GetOrderRequest request = GetOrderRequest.newBuilder().setAccountId(getUserAccountId(channelHandlerContext))
                    .setOrderId(getOrderData.getOrderId()).build();
            final GetOrderReponse response = stockTradeDealServiceBlockingStub.getOrder(request);
            log.info("Process in StockDealProcessor.processGetOrder receive: " + response);
            // 返回成功报文
            stockHead = generateStockHead(stockMessage.getStockHead(), GlobalConstants.STATUS_OK);
            GetOrderResp.Builder orderResp = GetOrderResp.newBuilder();
            BeanUtils.copyProperties(response, orderResp);
            responseMessage = ResponseMessage.newBuilder().setStockHead(stockHead).setGetOrderResp(orderResp).build();

        }catch(ComponentException e) {
            // 业务异常返回
            log.error(e.getMessage(), e);
            stockHead = generateStockHead(stockMessage.getStockHead(), e.getErrorCodeEnum().getCode());
            responseMessage = ResponseMessage.newBuilder().setStockHead(stockHead).setMessage(e.getErrorCodeEnum().getMessage()).build();
        }catch (Exception e) {
            // 系统异常返回
            log.error(e.getMessage(), e);
            stockHead = generateStockHead(stockMessage.getStockHead(), GlobalConstants.STATUS_ERROR);
            responseMessage = ResponseMessage.newBuilder().setStockHead(stockHead).setMessage(e.getMessage()).build();
        }

        channelHandlerContext.writeAndFlush(responseMessage);

    }

}
