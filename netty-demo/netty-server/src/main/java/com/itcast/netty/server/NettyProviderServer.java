package com.itcast.netty.server;

import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.*;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioServerSocketChannel;
import io.netty.handler.codec.string.StringDecoder;
import io.netty.handler.codec.string.StringEncoder;
import io.netty.handler.logging.LogLevel;
import io.netty.handler.logging.LoggingHandler;

import java.io.BufferedReader;
import java.io.InputStreamReader;

/**
 * <p>Description: </p>
 * @date 2019/12/25
 * @author 贺锟 
 * @version 1.0
 * <p>Copyright:Copyright(c)2019</p>
 */
public class NettyProviderServer {

    /**
     * 服务端的端口
     */
    private int port;

    /**
     * 初始化构造方法
     * @param port
     */
    public NettyProviderServer(int port) {
        this.port = port;
    }

    /**
     * Netty通讯服务启动方法
     * @throws Exception
     */
    public void runServer() throws Exception  {
        // 1. 创建Netty服务

        // 2. 定义事件Boss监听组
        EventLoopGroup bossGroup = new NioEventLoopGroup();
        // 3. 定义用来处理已经被接收的连接
        EventLoopGroup workerGourp = new NioEventLoopGroup();
        try {
            // 4. 定义NIO的服务启动类
            ServerBootstrap sbs = new ServerBootstrap();
            // 5. 配置NIO服务启动的相关参数
            sbs.group(bossGroup, workerGourp)
                    .channel(NioServerSocketChannel.class)
                    // tcp最大缓存链接个数,它是tcp的参数, tcp_max_syn_backlog(半连接上限数量, CENTOS6.5默认是128)
                    .option(ChannelOption.SO_BACKLOG, 128)
                    //保持连接的正常状态
                    .childOption(ChannelOption.SO_KEEPALIVE, true)
                    // 根据日志级别打印输出
                    .handler(new LoggingHandler(LogLevel.INFO))
                    .childHandler(new ChannelInitializer<SocketChannel>() {
                        @Override
                        protected void initChannel(SocketChannel socketChannel) throws Exception {
                            //管道注册handler
                            ChannelPipeline pipeline = socketChannel.pipeline();
                            //编码通道处理
                            pipeline.addLast("decode", new StringDecoder());
                            //转码通道处理
                            pipeline.addLast("encode", new StringEncoder());
                            // 处理接收到的请求
                            pipeline.addLast(new NettyServerHandler()); // 这里相当于过滤器，可以配置多个
                        }
                    });

            System.err.println("-------server 启动------");
            // 6. 监听控制台的输入, 并将输入信息, 广播发送给客户端
            new Thread(new Runnable() {
                @Override
                public void run() {
                    try {
                        while(true) {
                            BufferedReader in = new BufferedReader((new InputStreamReader(System.in)));
                            String str = in.readLine();
                            if(NettyServerHandler.channelList.size()  > 0 ){
                                for(Channel channel : NettyServerHandler.channelList) {
                                    channel.writeAndFlush(str);
                                }
                            }
                        }
                    }catch(Exception e) {
                        e.printStackTrace();
                    }
                }
            }).start();

            // 7. 启动netty服务
            ChannelFuture cf = sbs.bind(port).sync();
            cf.channel().closeFuture().sync();

        }catch (Exception e) {
            e.printStackTrace();
        }


    }

    /**
     * netty服务端的启动
     * @param args
     * @throws Exception
     */
    public static void main(String[] args) throws Exception{
        new NettyProviderServer(9911).runServer();
    }


}
