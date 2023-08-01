package com.itcast.bulls.stock.proxy.processor;

import com.itcast.bulls.stock.common.exception.ComponentException;
import com.itcast.bulls.stock.common.utils.GlobalConstants;
import com.itcast.bulls.stock.struct.grpc.trade.RecallOrderRequest;
import com.itcast.bulls.stock.struct.grpc.trade.RecallOrderResponse;
import com.itcast.bulls.stock.struct.grpc.trade.StockPendingServiceGrpc;
import com.itcast.bulls.stock.struct.netty.trade.RecallOrderData;
import com.itcast.bulls.stock.struct.netty.trade.ResponseMessage;
import com.itcast.bulls.stock.struct.netty.trade.StockHeadProto;
import com.itcast.bulls.stock.struct.netty.trade.StockMessage;
import io.netty.channel.ChannelHandlerContext;
import lombok.extern.log4j.Log4j2;
import net.devh.boot.grpc.client.inject.GrpcClient;
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
public class StockRecallOrderProcessor extends AbstractStockProcessor implements IBaseStockProcessor {

    /**
     * 挂单服务的GRPC接口
     */
    @GrpcClient("grpc-pending-server")
    private StockPendingServiceGrpc.StockPendingServiceBlockingStub stockPendingServiceStub;

    /**
     * 处理客户端请求
     * @param channelHandlerContext
     * @param stockMessage
     */
    @Override
    public void processRequest(ChannelHandlerContext channelHandlerContext, StockMessage stockMessage) {

        ResponseMessage responseMessage = null;
        StockHeadProto.StockHead stockHead = null;
        try {
            // 获取请求参数信息
            RecallOrderData recallOrderData = stockMessage.getRecallOrderData();
            // 构造请求信息
            RecallOrderRequest request = RecallOrderRequest.newBuilder().setAccountId(getUserAccountId(channelHandlerContext))
                    .setOrderId(recallOrderData.getOrderId()).setStockId(recallOrderData.getStockId()).build();
            final RecallOrderResponse response = stockPendingServiceStub.recallOrder(request);
            log.info("Process in StockRecallOrderProcessor.processRequest receive: " + response);
            // 返回成功报文
            stockHead = generateStockHead(stockMessage.getStockHead(), response.getStatus());
            responseMessage = ResponseMessage.newBuilder()
                    .setStockHead(stockHead).setMessage(response.getMessage()).build();

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
        log.info("Process in StockRecallOrderProcessor.processRequest write : " + responseMessage);

    }
}