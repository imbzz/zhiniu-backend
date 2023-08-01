package com.itcast.netty.client;

import io.netty.channel.Channel;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;

/**
 * <p>Description:客户端处理器的实现 </p>
 * @date 2019/12/25
 * @author 贺锟 
 * @version 1.0
 * <p>Copyright:Copyright(c)2019</p>
 */
public class NettyClientHandler extends ChannelInboundHandlerAdapter {

    /**
     * 定义的服务端的连接通道 (用于消息的发送)
     */
    public static Channel serverChannel = null;

    @Override
    public void channelActive(ChannelHandlerContext ctx) throws Exception {
        super.channelActive(ctx);
        serverChannel = ctx.channel();
    }

    /**
     * 数据的监听读取
     * @param ctx
     * @param msg
     * @throws Exception
     */
    @Override
    public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {
        System.out.println("client-收到的消息: " + msg);
    }

    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {
        System.err.println("Client 读取数据出现异常");
        cause.printStackTrace();
        ctx.close();
    }
}
