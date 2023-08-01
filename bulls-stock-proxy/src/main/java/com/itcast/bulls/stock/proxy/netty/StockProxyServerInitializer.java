package com.itcast.bulls.stock.proxy.netty;

import com.google.protobuf.MessageLite;
import com.google.protobuf.MessageLiteOrBuilder;
import com.itcast.bulls.stock.struct.netty.trade.StockMessage;
import io.netty.buffer.ByteBuf;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelPipeline;
import io.netty.channel.socket.SocketChannel;
import io.netty.handler.codec.MessageToMessageDecoder;
import io.netty.handler.codec.MessageToMessageEncoder;
import io.netty.handler.codec.http.HttpObjectAggregator;
import io.netty.handler.codec.http.HttpServerCodec;
import io.netty.handler.codec.http.websocketx.*;
import io.netty.handler.codec.http.websocketx.extensions.compression.WebSocketServerCompressionHandler;
import io.netty.handler.codec.protobuf.ProtobufDecoder;
import io.netty.handler.codec.protobuf.ProtobufVarint32FrameDecoder;
import io.netty.handler.codec.protobuf.ProtobufVarint32LengthFieldPrepender;
import io.netty.handler.logging.LoggingHandler;
import io.netty.handler.stream.ChunkedWriteHandler;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.List;

import static io.netty.buffer.Unpooled.wrappedBuffer;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@Component
@Log4j2
public class StockProxyServerInitializer extends ChannelInitializer<SocketChannel> {

    /**
     * 是否开启Netty的调试日志
     */
    @Value("${socket.netty.debug:false}")
    private boolean debug;

    /**
     * Netty服务端的数据处理器
     */
    @Autowired
    private StockProxyServerHandler stockProxyServerHandler;

    /**
     * 服务端连接通道的初始化配置
     * @param ch
     * @throws Exception
     */
    @Override
    protected  void initChannel(SocketChannel ch) throws Exception {
        ChannelPipeline pipeline = ch.pipeline();

        // 判断是否开调试日志功能
        if(debug) {
            pipeline.addLast(new LoggingHandler());
        }

        // 增加对HTTP SERVER的支持, 初始化包的大小
        pipeline.addLast(new HttpServerCodec());
        // HTTP 聚合解析, 设置聚合内容的最大长度
        pipeline.addLast(new HttpObjectAggregator(Integer.MAX_VALUE));
        // 支持大数据流的写入
        pipeline.addLast(new ChunkedWriteHandler());
        // 支持WebSocket数据压缩
        pipeline.addLast(new WebSocketServerCompressionHandler());
        // WebSocket协议配置, 设置访问路径
        pipeline.addLast(new WebSocketServerProtocolHandler("/stock", null, true, Integer.MAX_VALUE));

        // Protobuf的解码器
        pipeline.addLast(new ProtobufVarint32FrameDecoder());
        pipeline.addLast(new ProtobufVarint32LengthFieldPrepender());


        // WebSocket协议包解码
        pipeline.addLast(new MessageToMessageDecoder<WebSocketFrame>() {
            @Override
            protected void decode(ChannelHandlerContext ctx, WebSocketFrame frame, List<Object> objs) throws Exception {
                log.info("decode client data ------------------------");
                if (frame instanceof TextWebSocketFrame) {
                    TextWebSocketFrame textFrame = (TextWebSocketFrame)frame;
                    log.info("MsgType is TextWebSocketFrame");
                } else if (frame instanceof BinaryWebSocketFrame) {
                    ByteBuf buf = ((BinaryWebSocketFrame) frame).content();
                    objs.add(buf);
                    buf.retain();
                    log.info("MsgType is BinaryWebSocketFrame");
                } else if (frame instanceof PongWebSocketFrame) {
                    log.info("MsgType is PongWebSocketFrame ");
                } else if (frame instanceof CloseWebSocketFrame) {
                    log.info("MsgType is CloseWebSocketFrame");
                    ch.close();
                }

            }
        });
        // WebSocket协议包编码
        pipeline.addLast(new MessageToMessageEncoder<MessageLiteOrBuilder>() {
            @Override
            protected void encode(ChannelHandlerContext ctx, MessageLiteOrBuilder msg, List<Object> out) throws Exception {
                ByteBuf result = null;
                if (msg instanceof MessageLite) {
                    result = wrappedBuffer(((MessageLite) msg).toByteArray());
                }
                if (msg instanceof MessageLite.Builder) {
                    result = wrappedBuffer(((MessageLite.Builder) msg).build().toByteArray());
                }

                // 下面再转成websocket二进制流，因为客户端不能直接解析protobuf编码生成的数据
                WebSocketFrame frame = new BinaryWebSocketFrame(result);
                out.add(frame);
            }
        });
        // Protobuf的解码器， 转换为自定义的StockMessage
        pipeline.addLast(new ProtobufDecoder(StockMessage.getDefaultInstance()));


        // 自定义数据处理器
        pipeline.addLast(stockProxyServerHandler);


    }



}
