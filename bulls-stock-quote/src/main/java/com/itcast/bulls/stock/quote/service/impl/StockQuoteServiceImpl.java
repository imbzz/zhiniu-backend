package com.itcast.bulls.stock.quote.service.impl;

import com.itcast.bulls.stock.common.constants.StockMarketEnum;
import com.itcast.bulls.stock.common.generator.DateUtils;
import com.itcast.bulls.stock.common.generator.GlobalIDGenerator;
import com.itcast.bulls.stock.common.math.MathUtils;
import com.itcast.bulls.stock.common.utils.GlobalConstants;
import com.itcast.bulls.stock.entity.product.TradeStock;
import com.itcast.bulls.stock.entity.product.TradeStockCategory;
import com.itcast.bulls.stock.entity.quote.TradeStockKline;
import com.itcast.bulls.stock.entity.quote.TradeStockQuoteLast;
import com.itcast.bulls.stock.quote.mq.QuoteSender;
import com.itcast.bulls.stock.quote.repository.biz.TradeStockCategoryRepository;
import com.itcast.bulls.stock.quote.repository.biz.TradeStockRepository;
import com.itcast.bulls.stock.quote.repository.trade.TradeStockKlineRepository;
import com.itcast.bulls.stock.quote.repository.trade.TradeStockQuoteLastRepository;
import com.itcast.bulls.stock.quote.service.IStockQuoteService;
import com.itcast.bulls.stock.quote.sources.JuheThirdApi;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.Cache;
import org.springframework.cache.support.SimpleValueWrapper;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;
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
public class StockQuoteServiceImpl implements IStockQuoteService {

    /**
     * 全局唯一ID生成器
     */
    @Autowired
    private GlobalIDGenerator globalIDGenerator;

    /**
     * 股票产品的数据层接口
     */
    @Autowired
    private TradeStockRepository tradeStockRepository;

    /**
     * 股票产品分类的数据层接口
     */
    @Autowired
    private TradeStockCategoryRepository tradeStockCategoryRepository;

    /**
     * 股票实时行情的数据层接口
     */
    @Autowired
    private TradeStockQuoteLastRepository tradeStockQuoteLastRepository;

    /**
     * 股票的K线数据层接口
     */
    @Autowired
    private TradeStockKlineRepository tradeStockKlineRepository;

    /**
     * 第三方行情源对接封装实现工具(对接的是聚合数据平台)
     */
    @Autowired
    private JuheThirdApi juheThirdApi;

    /**
     * Redis 缓存管理器
     */
    @Autowired
    private RedisCacheManager redisCacheManager;

    /**
     * Redis 缓存操作模板对象
     */
    @Autowired
    private RedisTemplate redisTemplate;


    /**
     * 标记股票是否需要写入开盘价
     */
    public Map<Long, Long> stockOpenCache = new ConcurrentHashMap<>();

    /**
     * 行情消息发送者
     */
    @Autowired
    private QuoteSender quoteSender;


    /**
     * K线缓存数据
     */
    private Map<Long, TradeStockKline> klineMap = new ConcurrentHashMap<>();


    /**
     * 判断是否休市
     * @return
     */
    private boolean isCloseTime(int marketCode) {

        TradeStockCategory category = tradeStockCategoryRepository.findByCode(StockMarketEnum.parseByMarketNo(marketCode).getMarketFlag());
        if(null != category) {
            // 当前时间大于休市时间
            if(DateUtils.compareMins(category.getEndMins())) {
                return true;
            }
        }
        return false;
    }



    /**
     * 拼装时间转换为分钟计算
     * @param date
     * @param time
     * @return
     */
    private static Long cvtMinuteTime(long datetime) {
        Instant instant = Instant.ofEpochSecond(datetime);
        return LocalDateTime.ofInstant(instant, ZoneId.systemDefault()).truncatedTo(ChronoUnit.MINUTES).toEpochSecond(ZoneOffset.ofHours(8));
    }

    /**
     * 获取所有有效的股票产品
     * @return
     */
    @Override
    public List<TradeStock> findAllValidStocks(){
        return tradeStockRepository.findAllByStatus(GlobalConstants.INT_ENABLE);
    }



    /**
     * 计算涨跌幅比例
     * @param quoteLast
     */
    private double calcPriceRate(Long lastPrice, Long lastClosePrice) {
        double priceRate = 0;
        if(null != lastClosePrice) {
            long diffPrice = MathUtils.sub(lastPrice, lastClosePrice);
            if(diffPrice > 0) {
                // 正值
                priceRate = MathUtils.div2Double(diffPrice, lastClosePrice) * 100;
            }else if(diffPrice == 0 ) {
                // 相等
                priceRate = 0;
            }else {
                // 负值
                priceRate = - MathUtils.div2Double(diffPrice, lastClosePrice) * 100;
            }
        }

        return priceRate;
    }


    /**
     * 获取产品行情数据(实时行情)
     * @param stock
     * @param closeDiffMins
     */
    public void sendRealQuote(TradeStock stock, int closeDiffMins) {
        log.info("Process in StockQuoteServiceImpl.sendRealQuote method. stock " + stock.getCode() + ", request realtime quote. ");
        // 1. 调用第三方行情源的接口, 去获取最新的行情报价数据
        TradeStockQuoteLast quoteLast = juheThirdApi.getStockReal(stock);
        try {
            // 2. 判断实时行情报价是否获取成功
            if(null != quoteLast) {
                // 3. 获取K线加工的缓存管理器, 将实时行情报价数据放入缓存
                Cache cache = redisCacheManager.getCache(GlobalConstants.STOCK_QUOTE_GENERATE_KLINE_KEY);
                cache.put(stock.getCode() + "|" + quoteLast.getTime(), quoteLast);

                // 4. 更新处理收盘价(收盘后5分钟内进行更新)
                if(closeDiffMins >=0 && closeDiffMins <=5) {
                    updateClosePrice(quoteLast);
                }

                // 5. 更新开盘价(如果行情源没有提供, 需要自定义实现)
                updateOpenPrice(quoteLast);

                // 6. 股票涨跌幅比例( 计算公式: (最新价-作收价) / 作收价)
                quoteLast.setPriceRate(calcPriceRate(quoteLast.getLastPrice(), quoteLast.getLastClosePrice()));

                // 7. 更新股票报价信息缓存
                Cache lastPriceCache = redisCacheManager.getCache(GlobalConstants.STOCK_QUOTE_LAST_PRICE_KEY);
                lastPriceCache.put(stock.getId(), quoteLast);

                // 8. 发送数据至MQ消息队列中
                quoteSender.sendObject(quoteLast);

            }
        }catch(Exception e) {
            log.error(e.getMessage(), e);
        }
    }


    /**
     * 更新收盘价
     * @param quoteLast
     */
    private void updateClosePrice(TradeStockQuoteLast quoteLast) {
        // 判断是否到达收盘时间
        if(isCloseTime(quoteLast.getMarketNo())) {
            // 当天收盘价
            Cache curLastPriceCache = redisCacheManager.getCache(GlobalConstants.STOCK_QUOTE_OPEN_PRICE_CUR_KEY);
            // 昨日收盘价
            Cache lastPriceCache = redisCacheManager.getCache(GlobalConstants.STOCK_QUOTE_CLOSE_PRICE_LAST_KEY);
            // 更新作收价
            if(null != lastPriceCache.get(quoteLast.getStockId())) {
                String lastClosePriceStr = (String) lastPriceCache.get(quoteLast.getStockId()).get();
                String[] lastClosePriceArr = lastClosePriceStr.split("\\|");
                if(!DateUtils.getFmtToday().equals(lastClosePriceArr[1])) {
                    // 根据时间判断, 如果不一致, 代表首次修改, 对作收价做更新处理, 避免重复更新
                    Long curLastPrice = (Long)curLastPriceCache.get(quoteLast.getStockId()).get();
                    // 将当天的收盘价更新为昨日的收盘价, 附带时间标记, 下一天收盘时需要再次更新
                    lastPriceCache.put(quoteLast.getStockId(), curLastPrice + "|" + DateUtils.getFmtToday());
                    log.info("update lastprice cache, stockId: {}, value: {}", quoteLast.getStockId(), curLastPrice + "|" + DateUtils.getFmtToday());
                }
            }else {
                // 如果缓存中, 作收价信息不存在, 则将当前的收盘价放入缓存
                lastPriceCache.put(quoteLast.getStockId(), quoteLast.getLastPrice() + "|" + DateUtils.getFmtToday());
            }
            // 更新当前的收盘价
            curLastPriceCache.put(quoteLast.getStockId(), quoteLast.getLastPrice());
        }
    }


    /**
     * 获取产品行情数据(模拟行情)
     * @param stock
     * @param closeDiffMins
     */
    public void sendSimulationQuote(TradeStock stock, int closeDiffMins) {

        log.info("Process in StockQuoteServiceImpl.sendSimulationQuote method. stock " + stock.getCode() + ", request realtime quote. ");

        TradeStockQuoteLast quoteLast =  null;
        try {
            // 测试 从缓存中获取行情, 并生成随机价格
            Cache lastPriceCache = redisCacheManager.getCache(GlobalConstants.STOCK_QUOTE_LAST_PRICE_KEY);
            Cache.ValueWrapper quoteLastWrapper = lastPriceCache.get(stock.getId());
            if(quoteLastWrapper != null ) {
                quoteLast = (TradeStockQuoteLast)quoteLastWrapper.get();
                // 价格生成随机数
                int radInt = new Random().nextInt(20);
                if(radInt > 10) {
                    quoteLast.setLastPrice(quoteLast.getLastPrice() + radInt);
                }else {
                    quoteLast.setLastPrice(quoteLast.getLastPrice() - radInt);
                }
                quoteLast.setVolume(quoteLast.getVolume() + new Random().nextInt(10000));
                quoteLast.setAmount(quoteLast.getAmount() + new Random().nextInt(1000000));
                quoteLast.setTime(System.currentTimeMillis() / 1000);
                lastPriceCache.put(stock.getId(), quoteLast);

            }else {
                // 没有取到数据, 直接返回
                log.info("not found cache data!");
                return ;
            }

            //放置缓存
            Cache cache = redisCacheManager.getCache(GlobalConstants.STOCK_QUOTE_GENERATE_KLINE_KEY);
            cache.put(stock.getCode() + "|" + quoteLast.getTime(), quoteLast);

            // 更新收盘价(收盘后5分钟内进行更新)
            if(closeDiffMins >= 0 && closeDiffMins<=5) {

            }
            // 更新开盘价
            updateOpenPrice(quoteLast);

            // 计算涨跌比例 ( (最新价-昨收价)/昨收价)
            quoteLast.setPriceRate(calcPriceRate(quoteLast.getLastPrice(), quoteLast.getLastClosePrice()));

            // 发送数据
            quoteSender.sendObject(quoteLast);
        }catch (Exception e) {
            log.error(e.getMessage(), e);
        }
    }


    /**
     * 获取股票产品的行情源数据
     * @param stock
     * @param closeDiffMins
     */
    @Override
    public void fetchStockQuote(TradeStock stock, int closeDiffMins) {
        log.info("Process in StockQuoteServiceImpl.fetchStockQuote method. ");
        if(1 == 1) {
            // 发送模拟行情
            sendSimulationQuote(stock, closeDiffMins);
        }else {
            // 发送实时行情
            sendRealQuote(stock, closeDiffMins);
        }

    }

    /**
     * 更新开盘价
     * @param quoteLast
     */
    private void updateOpenPrice(TradeStockQuoteLast quoteLast) {
        // 获取开盘价的缓存信息
        Long openPrice = stockOpenCache.get(quoteLast.getStockId());
        if(openPrice == null ) {
            // 写入开盘价的缓存信息
            Cache curOpenPriceCache = redisCacheManager.getCache(GlobalConstants.STOCK_QUOTE_OPEN_PRICE_CUR_KEY);
            curOpenPriceCache.put(quoteLast.getStockId(), quoteLast.getLastPrice());
            // 更新MAP缓存
            stockOpenCache.put(quoteLast.getStockId(), quoteLast.getLastPrice());
        }
    }

    /**
     * 初始化开盘价缓存信息, 从Redis缓存中加载数据
     */
    @PostConstruct
    @Override
    public void initOpenPriceCache() {
        Set<String> keys = redisTemplate.keys(GlobalConstants.STOCK_QUOTE_OPEN_PRICE_CUR_KEY + "*");
        if(null != keys && !keys.isEmpty()) {
            // 获取缓存对象, 根据key遍历处理
            Cache cache = redisCacheManager.getCache(GlobalConstants.STOCK_QUOTE_OPEN_PRICE_CUR_KEY);
            keys.stream().forEach(key -> {
                // 将key转换, 获取stockId
                Long stockId = Long.valueOf(key.replaceAll(GlobalConstants.STOCK_QUOTE_OPEN_PRICE_CUR_KEY + "::", ""));
                Cache.ValueWrapper valueWrapper = cache.get(stockId);
                if(null!= valueWrapper) {
                    Long value = (Long)valueWrapper.get();
                    stockOpenCache.put(Long.valueOf(stockId), value);
                }

            });
        }

    }

    /**
     * 定时重置开盘价缓存信息, 确保当天的开盘价能够正常记录( 每天凌晨1点执行, 1小时缓冲时间, 在1点~2点每十分钟运行一次)
     *
     */
    @Override
    @Scheduled(cron = "0 0/10 1 * * ? ")
    public void scheduleRestOpenPriceCache() {

        stockOpenCache.keySet().forEach(stockId -> {
            stockOpenCache.put(stockId, null);
        });

    }


    /**
     * 定时持久化行情缓存数据(执行频率, 每隔一分钟执行一次)
     */
    @Override
    @Scheduled(cron = "0 0/1 * * * ?")
    public void schedulePersistCache() {
        log.info("行情持久化, 定时任务处理 ==> 开始执行!");
        try {
            // 1. 通过key做模糊搜索, 找到所有的行情缓存信息
            Set<String> keys = redisTemplate.keys(GlobalConstants.STOCK_QUOTE_GENERATE_KLINE_KEY + "*");
            if(null != keys && !keys.isEmpty()) {
                // 获取缓存管理器
                Cache cache = redisCacheManager.getCache(GlobalConstants.STOCK_QUOTE_GENERATE_KLINE_KEY);
                // 2. 针对模糊搜索获取的key信息, 做遍历处理
                keys.stream().sorted().forEach(key -> {
                    SimpleValueWrapper valueWrapper = (SimpleValueWrapper) cache.get(key.replaceAll(GlobalConstants.STOCK_QUOTE_GENERATE_KLINE_KEY + "::", ""));
                    if(null != valueWrapper) {
                        TradeStockQuoteLast quoteLast = (TradeStockQuoteLast) valueWrapper.get();
                        // 3. 根据股票ID以及报价时间, 去数据库查找有没有对应的数据, 避免生成重复的行情数据
                        TradeStockQuoteLast dbQuoteLast = tradeStockQuoteLastRepository.getDistinctByStockIdAndTime(quoteLast.getStockId(), quoteLast.getTime());
                        if(null != dbQuoteLast) {
                            quoteLast.setId(dbQuoteLast.getId());
                        }
                        // 4. 如果数据存在,  根据ID进行更新, 如果不存在, save方法就会保存并生成新的数据
                        tradeStockQuoteLastRepository.save(quoteLast);

                        // 5. 处理并生成K线数据
                        processKline(quoteLast);

                        // 6. 删除行情生成所需的缓存数据
                        cache.evict(quoteLast.getStockCode() + "|" + quoteLast.getTime());

                    }
                });
            }
        }catch(Exception e) {
            log.error(e.getMessage(), e);
        }

    }

    /**
     * 生成K线行情数据
     * @param quoteLast
     */
    private void processKline(TradeStockQuoteLast quoteLast) {
        // 从缓存获取K线行情数据
        TradeStockKline kline = klineMap.get(quoteLast.getStockId());
        if(null == kline) {
            // 生成新的K线数据
            kline = newKline(quoteLast);
            klineMap.put(quoteLast.getStockId(), kline);
        }else {
            // 行情K线存在的处理逻辑
            // 判断是否达到指定的周期(判断时间差是否超过K线的指定周期, 1分钟)
            long diffTime = quoteLast.getTime() - kline.getTime();
            if(diffTime > 0 && diffTime < GlobalConstants.KLINE_PERIOD_60) {
                // 时间差在K线周期范围之内, 更新K线行情数据
                if(quoteLast.getLastPrice() < kline.getPriceLow()) {
                    // 更新最低价
                    kline.setPriceLow(quoteLast.getLastPrice());
                }
                // 更新最高价
                if(quoteLast.getLastPrice() > kline.getPriceHigh()) {
                    kline.setPriceHigh(quoteLast.getLastPrice());
                }
                // 更新收盘价
                kline.setPriceClose(quoteLast.getLastPrice());
            }else if(diffTime > GlobalConstants.KLINE_PERIOD_60) {
                // 超过K线周期, 需要持久化, 并且要生成新的K线数据
                // 记录上一个K线周期的收盘价
                long lastClosePrice = 1L;
                try {
                    // 计算K线的成交金额与成交量(行情源的成交金额和成交量是当日累加的总量, 需要计算差值)
                    kline.setAmount(quoteLast.getAmount() - kline.getAmount());
                    kline.setVolume(quoteLast.getVolume() - kline.getVolume());
                    kline.setTime(cvtMinuteTime(kline.getTime()));
                    lastClosePrice = kline.getPriceClose();
                    kline.setId(globalIDGenerator.nextId());
                    //生成1分钟的周期K线数据
                    kline.setDataType(GlobalConstants.KLINE_PERIOD_60);
                    tradeStockKlineRepository.save(kline);
                }catch(Exception e) {
                    log.error(e.getMessage(), e);
                }

                // 生成新的K线
                kline = newKline(quoteLast);
                kline.setLastClosePrice(lastClosePrice);
                klineMap.put(quoteLast.getStockId(), kline);
            }else {
                log.warn("Process in StockQuoteServiceImpl.processKline method. ==> same or error time.");
            }
        }
    }


    /**
     * 生成新的K线
     * @param quoteLast
     * @return
     */
    private TradeStockKline newKline(TradeStockQuoteLast quoteLast){

        TradeStockKline kline = new TradeStockKline();
        // 设置股票的基本信息
        kline.setStockId(quoteLast.getStockId());
        kline.setStockCode(quoteLast.getStockCode());
        kline.setStockName(quoteLast.getStockName());
        kline.setAmount(quoteLast.getAmount());
        kline.setVolume(quoteLast.getVolume());

        kline.setPriceOpen(quoteLast.getLastPrice());
        kline.setPriceClose(quoteLast.getLastPrice());
        kline.setPriceHigh(quoteLast.getLastPrice());
        kline.setPriceLow(quoteLast.getLastPrice());
        kline.setTime(quoteLast.getTime());
        return kline;

    }

}
