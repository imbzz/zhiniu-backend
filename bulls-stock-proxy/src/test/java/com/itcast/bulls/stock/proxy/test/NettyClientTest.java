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

@Log4j2
public class NettyClientTest {

//    private static String serverIp = "10.10.20.22";
    private static String serverIp = "127.0.0.1";
    private static int serverPort = 19999;

    public static void main(String[] args) throws Exception {

        int clientNums = 10;
        for(int i=0; i<clientNums; i++) {
            new Thread(() ->{
                try {
                    ClientBoundHandler client = startClient();
                    // 用户登录
                    client.getBusinessHandler().userLogin();
                    Thread.sleep(3000L);
                    // 模拟发送十次下单请求
                    for(int j =0; j< 10; j++) {
                        client.getBusinessHandler().placeOrder();
                    }
                }catch(Exception e) {
                    e.printStackTrace();
                }
            }).start();
        }

        Thread.sleep(30 * 1000);

//        startClient(StockHeadProto.RequestType.GET_FINANCE_OVERVIEW);

    }


    /**
     * 启动客户都端， 不指定方法
     * @throws Exception
     */
    private static ClientBoundHandler startClient() throws Exception {

        return startClient(null);
    }

    /**
     * 启动客户端， 指定方法
     * @throws Exception
     */
    private static ClientBoundHandler startClient(StockHeadProto.RequestType method) throws Exception {

        // Netty客户端的启动配置
        EventLoopGroup group = new NioEventLoopGroup();
        Bootstrap bootstrap = new Bootstrap();
        ClientBoundHandler clientBoundHandler =  new ClientBoundHandler(method);
        bootstrap.group(group)
                .channel(NioSocketChannel.class)
                .option(ChannelOption.TCP_NODELAY, true)
                .option(ChannelOption.SO_KEEPALIVE, true)
                // 设置客户端日志打印级别
                .handler(new LoggingHandler(LogLevel.INFO))
                .handler(new ChannelInitializer<SocketChannel>() {
                    @Override
                    protected void initChannel(SocketChannel ch) {
                        ChannelPipeline pipeline = ch.pipeline();
                        // http客户端调用的支持配置
                        pipeline.addLast(new HttpClientCodec());
                        pipeline.addLast(new HttpObjectAggregator(655360));
                        // protobuf的解码配置
                        pipeline.addLast(new ProtobufVarint32FrameDecoder());
                        pipeline.addLast(new ProtobufVarint32LengthFieldPrepender());
                        // 指定客户端的业务数据处理器
                        pipeline.addLast("client_handler", clientBoundHandler );

                        // 协议包解码
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

                        // 协议包编码
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

        // WebSocket的调用配置
        ChannelFuture future;
        try {
            URI websocketURI = new URI(String.format("ws://%s:%d/stock", serverIp, serverPort));
            HttpHeaders httpHeaders = new DefaultHttpHeaders();
            //进行握手
            WebSocketClientHandshaker handshaker = WebSocketClientHandshakerFactory.newHandshaker(websocketURI, WebSocketVersion.V13, (String)null, true, httpHeaders, Integer.MAX_VALUE);
            log.debug("-ready to connect :"+ handshaker);
            // 连接至websocket服务， 获取channel通道
            Channel channel = bootstrap.connect(websocketURI.getHost(), websocketURI.getPort()).sync().channel();
            ClientBoundHandler handler = (ClientBoundHandler)channel.pipeline().get("client_handler");
            // 设置握手信息
            handler.setHandshaker(handshaker);
            handshaker.handshake(channel);
            //阻塞等待是否握手成功
            future = handler.handshakeFuture().sync();
            System.out.println("----channel:"+future.channel());


        } catch (Exception e) {
            e.printStackTrace();
        }

        return clientBoundHandler;
    }

}
