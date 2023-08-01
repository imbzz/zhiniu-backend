package com.itcast.bulls.stock.proxy.processor;

import com.itcast.bulls.stock.struct.netty.trade.StockMessage;
import io.netty.channel.ChannelHandlerContext;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
public interface IBaseStockProcessor {

    /**
     * 处理客户端的请求
     * @param channelHandlerContext
     * @param stockMessage
     */
    public void processRequest(ChannelHandlerContext channelHandlerContext, StockMessage stockMessage);

}
