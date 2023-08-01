package com.itcast.bulls.stock.proxy.mq;

import com.itcast.bulls.stock.common.utils.GlobalConstants;
import com.itcast.bulls.stock.entity.quote.TradeStockQuoteLast;
import com.itcast.bulls.stock.proxy.netty.StockProxyServerHandler;
import com.itcast.bulls.stock.struct.netty.trade.ResponseMessage;
import com.itcast.bulls.stock.struct.netty.trade.StockHeadProto;
import com.itcast.bulls.stock.struct.netty.trade.StockQuoteProto;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.BeanUtils;
import org.springframework.cloud.stream.annotation.StreamListener;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.stereotype.Service;

import javax.xml.ws.Response;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@Service
@Log4j2
public class ProxyQuoteConsumer {

    /**
     * 行情数据包自增ID(主要校验消息的连续性, 同时作为消息的唯一标识)
     */
    private Long seqId = 1l;

    @StreamListener("quote")
    public void receiveInput(@Payload TradeStockQuoteLast receiveMsg) {
        log.info("Process in ProxyQuoteConsumer.receiveInput method, receiveMsg : " + receiveMsg);
        // 1. 生成消息的序列ID( 在实际生产环境当中, 消息序列ID保持唯一性, 便于追踪, 维护和排查消息)
        long stockSeqId = seqId ++ ;
        // 2. 构造行情的数据包(用于下发给客户端使用)
        StockQuoteProto.QuoteRealtimeResp.Builder realtimeResp = StockQuoteProto.QuoteRealtimeResp.newBuilder();
        // 3. 复制接收的行情数据, 转换为下发至客户端的数据结构, 组装数据消息
        BeanUtils.copyProperties(receiveMsg, realtimeResp);
        StockHeadProto.StockHead stockHead = StockHeadProto.StockHead.newBuilder()
                .setRequestType(StockHeadProto.RequestType.QUOTE_REALTIME)
                .setSeqId(stockSeqId).setStatus(GlobalConstants.STATUS_OK).build();
        ResponseMessage responseMessage = ResponseMessage.newBuilder().setStockHead(stockHead)
                .setQuoteRealtimeResp(realtimeResp.build()).build();
        // 4. 消息组装完成之后, 广播群发行情的数据, 下发至所有的登录在线的客户端
        StockProxyServerHandler.channels.forEach(channel -> {
            channel.writeAndFlush(responseMessage);
        });
    }
}
