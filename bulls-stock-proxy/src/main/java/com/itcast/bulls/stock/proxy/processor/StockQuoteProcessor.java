package com.itcast.bulls.stock.proxy.processor;

import com.itcast.bull.stock.common.service.utils.BeanAssistant;
import com.itcast.bulls.stock.common.utils.GlobalConstants;
import com.itcast.bulls.stock.struct.grpc.quote.GetKlineReponse;
import com.itcast.bulls.stock.struct.grpc.quote.GetKlineRequest;
import com.itcast.bulls.stock.struct.grpc.quote.StockKlineServiceGrpc;
import com.itcast.bulls.stock.struct.netty.trade.*;
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
public class StockQuoteProcessor extends AbstractStockProcessor implements IBaseStockProcessor {

    /**
     * grpc行情服务接口
     */
    @GrpcClient("grpc-quote-server")
    private StockKlineServiceGrpc.StockKlineServiceBlockingStub stockKlineServiceBlockingStub;


    /**
     * 处理客户端请求
     * @param channelHandlerContext
     * @param stockMessage
     */
    @Override
    public void processRequest(ChannelHandlerContext channelHandlerContext, StockMessage stockMessage) {
        // 1. 获取客户端传递的请求参数信息
        KlineData klineData = stockMessage.getKlineData();
        // 2. 构造gRpc内部通讯的请求参数信息
        GetKlineRequest request = GetKlineRequest.newBuilder()
                .setStockId(klineData.getStockId()).setStockCode(klineData.getStockCode())
                .setTimeStart(klineData.getTimeStart()).setTimeEnd(klineData.getTimeEnd()).build();
        // 3. 调用远程GRPC行情服务接口, 获取K线数据
        final GetKlineReponse response = stockKlineServiceBlockingStub.getKline(request);
        log.info("Process in StockQuoteProcessor.processRequest method. call grpc result: " + response);

        // 4. 返回报文, 设置头部信息
        StockHeadProto.StockHead stockHead = generateStockHead(stockMessage.getStockHead(), GlobalConstants.STATUS_OK);
        // 5.将gprc返回K线数据转换为客户端接收的行情数据结构
        StockQuoteProto.KlineDataRespLists.Builder klineDataRespLists = StockQuoteProto.KlineDataRespLists.newBuilder();
        if(null != response.getKlineDataList() && !response.getKlineDataList().isEmpty()) {
            // 遍历处理, 转换数据对象
            response.getKlineDataList().stream().forEach(kline -> {
                StockQuoteProto.KlineDataResp.Builder klineDataResp = StockQuoteProto.KlineDataResp.newBuilder();
                BeanAssistant.copyNotNullProps(kline, klineDataResp);
                klineDataRespLists.addKlineDataResp(klineDataResp);
            });
        }
        // 6. 输出返回消息给客户端
        ResponseMessage responseMessage = ResponseMessage.newBuilder().setStockHead(stockHead)
                .setKlineDataRespLists(klineDataRespLists.build()).build();
        channelHandlerContext.writeAndFlush(responseMessage);
        log.info("Process in StockQuoteProcessor.processRequest method, process complete. ");

    }
}
