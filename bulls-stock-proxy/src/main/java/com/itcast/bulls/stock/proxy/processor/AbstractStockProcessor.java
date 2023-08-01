package com.itcast.bulls.stock.proxy.processor;

import com.itcast.bulls.stock.common.exception.ComponentException;
import com.itcast.bulls.stock.common.exception.constants.ApplicationErrorCodeEnum;
import com.itcast.bulls.stock.common.utils.GlobalConstants;
import com.itcast.bulls.stock.struct.netty.trade.StockHeadProto;
import io.netty.channel.ChannelHandlerContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
public abstract class AbstractStockProcessor {

    /**
     * 缓存管理器
     */
    @Autowired
    protected CacheManager cacheManager;


    /**
     * 生成返回的头部信息
     * @param stockHead
     * @param status
     * @return
     */
    protected StockHeadProto.StockHead generateStockHead(StockHeadProto.StockHead stockHead, String status) {
        StockHeadProto.StockHead stockHeadResult = StockHeadProto.StockHead.newBuilder()
                .setRequestType(stockHead.getRequestType()).setSeqId(stockHead.getSeqId())
                .setStatus(status).build();
        return stockHeadResult;
    }

    /**
     * 获取用户账号ID
     * @param ctx
     * @return
     */
    protected Long getUserAccountId(ChannelHandlerContext ctx ) throws ComponentException {

        // 从缓存当中获取交易账户ID
        Cache cache = cacheManager.getCache(GlobalConstants.STOCK_PROXY_USER_KEY);
        String channelId = ctx.channel().id().asLongText();
        if (cache !=  null &&  cache.get(channelId)!= null) {
            return (Long)cache.get(channelId).get();
        }
        // 没有获取有效的交易账户ID， 抛出异常
        throw new ComponentException(ApplicationErrorCodeEnum.SYS_NOT_ACCESS_USER);
    }

}

