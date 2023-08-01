package com.itcast.bulls.stock.proxy.processor;

import com.itcast.bulls.stock.common.exception.ComponentException;
import com.itcast.bulls.stock.common.utils.GlobalConstants;
import com.itcast.bulls.stock.struct.grpc.trade.GetAllPositionReponse;
import com.itcast.bulls.stock.struct.grpc.trade.GetAllPositionRequest;
import com.itcast.bulls.stock.struct.grpc.trade.StockPositionServiceGrpc;
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
public class StockPositionProcessor extends AbstractStockProcessor implements IBaseStockProcessor {

    /**
     * 持仓服务的gRpc接口
     */
    @GrpcClient("grpc-position-server")
    private StockPositionServiceGrpc.StockPositionServiceBlockingStub stockPositionServiceBlockingStub;

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
            // 构造请求信息
            GetAllPositionRequest request = GetAllPositionRequest.newBuilder()
                    .setAccountId(getUserAccountId(channelHandlerContext))
                    .build();
            final GetAllPositionReponse response = stockPositionServiceBlockingStub.getAllPositions(request);
            log.info("Process in StockPositionProcessor.processRequest receive: " + response);

            GetAllPositionList.Builder positionListBuilder = GetAllPositionList.newBuilder();
            if(null != response && response.getGetAllPositionDataCount() > 0){
                response.getGetAllPositionDataList().forEach(pos -> {
                    GetAllPositionData.Builder positionData = GetAllPositionData.newBuilder();
                    BeanUtils.copyProperties(pos, positionData);
                    positionListBuilder.addGetAllPositionData(positionData);
                });
            }

            // 返回成功报文
            stockHead = generateStockHead(stockMessage.getStockHead(), response.getStatus());
            responseMessage = ResponseMessage.newBuilder()
                    .setStockHead(stockHead).setMessage(response.getMessage())
                    .setGetAllPositionList(positionListBuilder).build();

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
        log.info("Process in StockPositionProcessor.processRequest write : " + responseMessage);

    }

}
