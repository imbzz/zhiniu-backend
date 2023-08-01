package com.itcast.bulls.stock.quote.service;

import com.itcast.bulls.stock.entity.product.TradeStock;
import org.springframework.scheduling.annotation.Scheduled;

import java.util.List;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
public interface IStockQuoteService {

    /**
     * 获取所有有效的股票产品
     * @return
     */
    public List<TradeStock> findAllValidStocks();

    /**
     * 获取股票产品的行情源数据
     * @param stock
     * @param closeDiffMins
     */
    public void fetchStockQuote(TradeStock stock, int closeDiffMins);

    /**
     * 初始化开盘价缓存信息, 从Redis缓存中加载数据
     */
    public void initOpenPriceCache();

    /**
     * 定时重置开盘价缓存信息, 确保当天的开盘价能够正常记录( 每天凌晨1点执行, 1小时缓冲时间, 在1点~2点每十分钟运行一次)
     *
     */
    public void scheduleRestOpenPriceCache();

    /**
     * 定时持久化行情缓存数据(执行频率, 每隔一分钟执行一次)
     */
    public void schedulePersistCache();
}

