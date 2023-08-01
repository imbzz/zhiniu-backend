package com.itcast.bulls.stock.pending.mq;

import com.itcast.bulls.stock.common.utils.GlobalConstants;
import com.itcast.bulls.stock.entity.quote.TradeStockQuoteLast;
import com.itcast.bulls.stock.pending.service.IStockTradePendingService;
import com.itcast.bulls.stock.pending.vo.LimitPlaceOrderRequestVo;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.lang3.RandomUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.cloud.stream.annotation.StreamListener;
import org.springframework.core.task.TaskExecutor;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@Service
@Log4j2
public class PendingQuoteConsumer {

    /**
     * 缓存管理器
     */
    @Autowired
    private CacheManager cacheManager;

    /**
     * 挂单服务的业务层接口, 负责核心逻辑处理
     */
    @Autowired
    private IStockTradePendingService stockTradePendingService;

    /**
     * 线程池配置
     */
    @Autowired
    private TaskExecutor taskExecutor;

    /**
     * 挂单服务的端口(每个挂单服务的端口不一样, 用于标识挂单服务的缓存队列)
     */
    @Value("${server.port}")
    private String serverPort;

    /**
     *  挂单队列的锁控制, 避免并发产生的数据不一致问题
     */
    public static Map<Long, Long> lockKeys = new ConcurrentHashMap<Long, Long>();

    @StreamListener("quote")
    public void receiveInput1(@Payload TradeStockQuoteLast quoteLastMsg) {
        log.info("Process in PendingQuoteConsumer.receiveInput1 method, quoteLastMsg: " + quoteLastMsg);
        taskExecutor.execute(() -> {
            // 为了提升处理性能, 加入线程池处理, 但同时也要保障线程安全(操作修改缓存)
            try {
                // 1. 根据股票产品ID进行加锁控制(减少锁的控制粒度, 提升处理性能, 保障并发线程锁对象是一致的)
                synchronized (getLock(quoteLastMsg.getStockId())) {
                    // 2. 获取挂单的缓存队列信息
                    String cacheKey = GlobalConstants.STOCK_PENDING_LIMIT_ORDER + ":" + serverPort;
                    Cache cache = cacheManager.getCache(cacheKey);
                    if(null != cache) {
                        Cache.ValueWrapper stockCache = cache.get(quoteLastMsg.getStockId());
                        if(null != stockCache) {
                            // 3. 根据股票ID, 获取对应的挂单队列数据
                            List<LimitPlaceOrderRequestVo> placeOrderRequestVoList = (List<LimitPlaceOrderRequestVo>)stockCache.get();

                            //4. 定义变量, 标识挂单队列是否变化修改(如果变化, 需要更新缓存)
                            boolean isListChange = false;

                            // 5. 遍历挂单缓存队列, 根据实时行情撮合匹配需成交的订单
                            for(Iterator<LimitPlaceOrderRequestVo> itr = placeOrderRequestVoList.iterator(); itr.hasNext();) {
                                try {
                                    // 6. 获取挂单数据
                                    LimitPlaceOrderRequestVo  placeOrder = itr.next();
                                    // 7. 判断挂单数据是否符合当前的行情价格
                                    boolean matchPrice = stockTradePendingService.checkMatchPrice(placeOrder.getDirection(), placeOrder.getExecPrice(), quoteLastMsg);
                                    if(matchPrice) {
                                        // 8. 符合当前价格, 生成订单成交信息
                                        stockTradePendingService.processMarketOrder(placeOrder, quoteLastMsg);
                                        if(placeOrder.getExecVolume() == 0) {
                                            // 9. 订单完全成交, 从缓存中清除挂单数据
                                            itr.remove();
                                        }
                                        isListChange = true;
                                    }
                                }catch(Exception e) {
                                    // 某个挂单出现问题, 不能阻塞后面的挂单运行
                                    log.error(e.getMessage(), e);
                                }
                            }

                            // 6. 挂单缓存的判断更新处理
                            if(isListChange) {
                                cache.put(quoteLastMsg.getStockId(), placeOrderRequestVoList);
                            }
                        }
                    }


                }


            }catch(Exception e) {
                log.error(e.getMessage(), e);
            }

        });

    }

    /**
     * 根据不同股票产品获取对象锁
     * @param stockId
     * @return
     */
    public static Long getLock(Long stockId) {
        if(null == lockKeys.get(stockId)) {
            lockKeys.put(stockId, stockId);
        }
        return lockKeys.get(stockId);
    }


    public static void main(String[] args) throws Exception {

        // 测试对象锁能否生效
        List<TradeStockQuoteLast> quoteLastList = new ArrayList<TradeStockQuoteLast>();
        // 构造十个对象
        for(int i=0; i< 10; i++) {
            TradeStockQuoteLast quoteLast = new TradeStockQuoteLast();
            quoteLast.setStockId(Long.valueOf(60000+ i));
            quoteLast.setVolume(0l);
            quoteLast.setLastPrice(0l);
            quoteLastList.add(quoteLast);
        }

        // 开启十个线程同时处理1000次任务
        for(int i=0; i< 10; i++) {
            new Thread(() -> {
                for(int j=0; j<1000; j++ ){
                    TradeStockQuoteLast quoteLast = quoteLastList.get(RandomUtils.nextInt(0, 10));
                    synchronized (getLock(quoteLast.getStockId())) {
                        // 普通方式累加
                        quoteLast.setVolume(quoteLast.getVolume() + 1);
                        // 线程安全方式累加
                        quoteLast.getCount().incrementAndGet();
                        quoteLast.setStockId(quoteLast.getStockId());
                    }
                }

            }).start();
        }

        Thread.sleep(5000l);

        // 检查两个数量是否一致
        quoteLastList.forEach(p ->{
            System.out.println(p.getStockId() + ", total :" + p.getCount() + ", actual :" + p.getVolume());

        });
    }

}