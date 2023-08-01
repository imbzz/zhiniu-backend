package com.itcast.bulls.stock.proxy.test;

import com.google.protobuf.MessageLite;
import com.google.protobuf.MessageLiteOrBuilder;
import com.itcast.bulls.stock.struct.netty.trade.ResponseMessage;
import com.itcast.bulls.stock.struct.netty.trade.StockHeadProto;
import io.netty.bootstrap.Bootstrap;
import io.netty.buffer.ByteBuf;
import io.netty.channel.*;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioSocketChannel;
import io.netty.handler.codec.MessageToMessageDecoder;
import io.netty.handler.codec.MessageToMessageEncoder;
import io.netty.handler.codec.http.DefaultHttpHeaders;
import io.netty.handler.codec.http.HttpClientCodec;
import io.netty.handler.codec.http.HttpHeaders;
import io.netty.handler.codec.http.HttpObjectAggregator;
import io.netty.handler.codec.http.websocketx.*;
import io.netty.handler.codec.protobuf.ProtobufDecoder;
import io.netty.handler.codec.protobuf.ProtobufVarint32FrameDecoder;
import io.netty.handler.codec.protobuf.ProtobufVarint32LengthFieldPrepender;
import io.netty.handler.logging.LogLevel;
import io.netty.handler.logging.LoggingHandler;
import lombok.extern.log4j.Log4j2;

import java.net.URI;
import java.util.List;

import static io.netty.buffer.Unpooled.wrappedBuffer;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@Log4j2
public class SimulateClient {

    /**
     * 服务端的IP
     */
    private static final String serverIp = "127.0.0.1";

    /**
     * 服务端的端口
     */
    private static final int serverPort = 19999;



    public static void main(String[] args) {
        startClient(null);
    }

    /**
     * 启动客户端, 支持指定的请求方法, 发送至服务端
     * @param method
     */
    private static void startClient(StockHeadProto.RequestType method) {
        // Netty的客户端启动配置
        EventLoopGroup group = new NioEventLoopGroup();
        Bootstrap bootstrap = new Bootstrap();
        bootstrap.group(group)
                .channel(NioSocketChannel.class)
                // 设置TCP连接配置信息
                .option(ChannelOption.TCP_NODELAY, true)
                .option(ChannelOption.SO_KEEPALIVE, true)
                //设置客户端的打印日志级别
                .handler(new LoggingHandler(LogLevel.INFO))
                // 初始化通道配置信息
                .handler(new ChannelInitializer<SocketChannel>() {
                    @Override
                    protected void initChannel(SocketChannel socketChannel) throws Exception {
                        ChannelPipeline pipeline = socketChannel.pipeline();
                        // 设置http客户端的调用配置
                        pipeline.addLast(new HttpClientCodec());
                        pipeline.addLast(new HttpObjectAggregator(Integer.MAX_VALUE));
                        // protobuf的解码配置
                        pipeline.addLast(new ProtobufVarint32FrameDecoder());
                        pipeline.addLast(new ProtobufVarint32LengthFieldPrepender());
                        // 指定客户端的数据接收处理器
                        pipeline.addLast("client_handler", new ClientBoundHandler(method));

                        // 配置websocket协议包的解码
                        pipeline.addLast(new MessageToMessageDecoder<WebSocketFrame>() {
                            @Override
                            protected void decode(ChannelHandlerContext ctx, WebSocketFrame frame, List<Object> objs) throws Exception {
                                System.out.println("MessageToMessageDecoder msg ------------------------");
                                if (frame instanceof TextWebSocketFrame) {
                                    TextWebSocketFrame textFrame = (TextWebSocketFrame)frame;
                                    System.out.println("TextWebSocketFrame");
                                } else if (frame instanceof BinaryWebSocketFrame) {
                                    ByteBuf buf = ((BinaryWebSocketFrame) frame).content();
                                    objs.add(buf);
                                    buf.retain();
                                    System.out.println("BinaryWebSocketFrame received------------------------");
                                } else if (frame instanceof PongWebSocketFrame) {
                                    System.out.println("WebSocket Client received pong");
                                } else if (frame instanceof CloseWebSocketFrame) {
                                    System.out.println("receive close frame");
                                }

                            }
                        });

                        // 配置websocket协议包的编码
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

                                // 下面再转成websocket二进制流，因为客户端不能直接解析protobuf编码生成的
                                WebSocketFrame frame = new BinaryWebSocketFrame(result);
                                out.add(frame);
                            }
                        });

                        pipeline.addLast(new ProtobufDecoder(ResponseMessage.getDefaultInstance()));

                    }
                });

        // WebSocket的连接调用配置
        ChannelFuture future = null;
        try {
            URI websocketURI = new URI(String.format("ws://%s:%d/stock", serverIp, serverPort));
            HttpHeaders httpHeaders = new DefaultHttpHeaders();
            // 初始化, 配置握手信息
            WebSocketClientHandshaker handshaker = WebSocketClientHandshakerFactory.newHandshaker(websocketURI,
                    WebSocketVersion.V13, null, true, httpHeaders, Integer.MAX_VALUE);
            log.debug("read to connect: " + handshaker);
            // 连接至WebSocket服务, 获取channel连接通道
            Channel channel = bootstrap.connect(websocketURI.getHost(), websocketURI.getPort()).sync().channel();
            // 获取连接通道, 发送握手信息
            ClientBoundHandler handler = (ClientBoundHandler)channel.pipeline().get("client_handler");
            handshaker.handshake(channel);
            handler.setHandshaker(handshaker);
            future = handler.handshakeFuture().sync();
            System.out.println("handshake complete.");

        } catch (Exception e) {
            e.printStackTrace();
            log.error(e.getMessage(), e);
        }
    }
}
