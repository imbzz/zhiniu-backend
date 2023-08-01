package com.itcast.bulls.stock.task.service.impl;

import com.itcast.bulls.stock.common.generator.DateUtils;
import com.itcast.bulls.stock.common.math.MathUtils;
import com.itcast.bulls.stock.common.utils.GlobalConstants;
import com.itcast.bulls.stock.entity.quote.TradeStockQuoteLast;
import com.itcast.bulls.stock.entity.trade.TradePosition;
import com.itcast.bulls.stock.task.dao.trade.ITradePositionDao;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.Cache;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@Service
@Log4j2
public class AccountPositionInterestServiceImpl implements com.itcast.bulls.stock.task.service.IAccountPositionInterestService {

    /**
     * 持仓数据层接口
     */
    @Autowired
    private ITradePositionDao tradePositionDao;

    /**
     * 持仓利息利率(四位), 万分比为单位
     */
    private Integer interest = 2;

    /**
     * 缓存服务管理器
     */
    @Autowired
    private RedisCacheManager redisCacheManager;


    /**
     * null 值转换为0
     * @param interest
     * @return
     */
    private Long isNullToZero(Long value) {
        return value == null ? 0 : value;
    }

    /**
     * 获取股票产品的最新报价
     *
     * @param stockId
     * @return
     * @throws ComponentException
     */
    private TradeStockQuoteLast getTradeStockQuoteLast(Long stockId) {

        // 从缓存获取数据
        Cache lastPriceCache = redisCacheManager.getCache(GlobalConstants.STOCK_QUOTE_LAST_PRICE_KEY);
        Cache.ValueWrapper quoteLastWrapper = lastPriceCache.get(stockId);
        TradeStockQuoteLast quoteLast = null;
        if (quoteLastWrapper != null) {
            quoteLast = (TradeStockQuoteLast) quoteLastWrapper.get();
        }

        return quoteLast;
    }

    /**
     * 生成账户的仓位利息
     * @param param
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void generateAccountPositionInterest(String param) {
        log.info("Process in AccountPositionInterestServiceImpl.generateAccountPositionInterest method.");
        // 获取当天的格式化日期, yyyyMMdd
        String fmtDay = DateUtils.getFmtDay();
        // 1. 根据日期, 获取所有有效的持仓数据
        // 更新当天和之前的仓位数据, 不能重复更新计算利息
        List<TradePosition> tradePositions = tradePositionDao.findAllValidPositionsByInterestTime(fmtDay);
        // 2. 根据股票ID对数据做汇总处理, 减少SQL查询次数
        Map<Long, List<TradePosition>> groupByPositions = tradePositions.stream().collect(Collectors.groupingBy(TradePosition :: getStockId));

        // 3. 根据股票ID, 遍历所有持仓数据
        groupByPositions.forEach((stockId, positions) -> {
            if(null != positions && positions.size() > 0) {
                // 4. 获取最新股票行情报价
                TradeStockQuoteLast quoteLast = getTradeStockQuoteLast(stockId);
                if(null != quoteLast) {
                    positions.forEach( pos -> {
                        // 5. 计算仓位市值 = 持仓数量* 股票最新价
                        Long totalMarketValue = MathUtils.mul(pos.getVolume(), quoteLast.getLastClosePrice());
                        // 6. 计算仓位利息, 计算单位: 万分比。 利息=市值 * 利息率
                        Long posInterest = MathUtils.div2Long(MathUtils.mul(totalMarketValue, interest), 10000);
                        // 7. 累加持仓利息
                        pos.setInterest(isNullToZero(pos.getInterest()) + posInterest);
                        // 8. 写入持仓利息的更新时间, 防止重复计算
                        pos.setInterestTime(fmtDay);
                        // 9. 更新利息的计算结果和利息的更新时间
                        tradePositionDao.updateInterest(pos);
                    });

                }



            }

        });


    }
}
