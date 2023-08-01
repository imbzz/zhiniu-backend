package com.itcast.netty.client;

import io.netty.bootstrap.Bootstrap;
import io.netty.channel.*;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioSocketChannel;
import io.netty.handler.codec.string.StringDecoder;
import io.netty.handler.codec.string.StringEncoder;

import java.io.BufferedReader;
import java.io.InputStreamReader;

/**
 * <p>Description:通过Netty实现客户端 </p>
 * @date 2019/12/25
 * @author 贺锟 
 * @version 1.0
 * <p>Copyright:Copyright(c)2019</p>
 */
public class NettyClientServer {

    /**
     * 服务器的IP
     */
    private String ip;

    /**
     * 服务器的端口
     */
    private int port;

    /**
     * 通过构造方法, 将参数注入进来
     * @param ip
     * @param port
     */
    public NettyClientServer(String ip , int port) {
        this.ip  = ip;
        this.port = port;
    }

    /**
     * 启动Netty客户端
     * @throws Exception
     */
    private void runServer() throws Exception  {

        // 1. 定义Boss监听组
        EventLoopGroup bossGroup = new NioEventLoopGroup();
        // 2. 定义服务启动类
        Bootstrap bs = new Bootstrap();

        // 3. 定义服务启动参数
        bs.group(bossGroup)
                .channel(NioSocketChannel.class)
                // 设置保持长连接
                .option(ChannelOption.SO_KEEPALIVE, true)
                .handler(new ChannelInitializer<SocketChannel>() {
                    @Override
                    protected void initChannel(SocketChannel socketChannel) throws Exception {
                        //管道注册handler
                        ChannelPipeline pipeline = socketChannel.pipeline();
                        //编码通道处理
                        pipeline.addLast("decode", new StringDecoder());
                        //转码通道处理
                        pipeline.addLast("encode", new StringEncoder());
                        // 处理来自服务端的响应信息
                        socketChannel.pipeline().addLast(new NettyClientHandler());
                    }
                });
        // 4. 启动客户端
        ChannelFuture cf =  bs.connect(ip, port).sync();
        System.out.println("---------- Client 客户端启动成功 ----------- ");

        String reqStr = "客户端发起连接请求!";
        Channel channel = cf.channel();
        // 5. 客户端发送连接数据
        channel.writeAndFlush(reqStr);

        // 6. 监听控制输入, 将信息发送给服务端
        new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    while (true) {
                        BufferedReader in = new BufferedReader((new InputStreamReader(System.in)));
                        String msg = in.readLine();
                        channel.writeAndFlush(msg);
                    }
                }catch(Exception e) {
                    e.printStackTrace();
                }
            }
        }).start();

    }

    /**
     * Netty 客户端服务的启动
     * @param args
     * @throws Exception
     */
    public static void main(String[] args) throws Exception {
        new NettyClientServer("127.0.0.1", 9911).runServer();
    }


}
