package com.itcast.bulls.stock.position.service.impl;

import com.itcast.bulls.stock.common.math.MathUtils;
import com.itcast.bulls.stock.common.utils.GlobalConstants;
import com.itcast.bulls.stock.entity.quote.TradeStockQuoteLast;
import com.itcast.bulls.stock.entity.trade.TradePosition;
import com.itcast.bulls.stock.position.dao.trade.ITradePositionDao;
import com.itcast.bulls.stock.position.service.IStockPositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.Cache;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@Service
public class StockPositionServiceImpl implements IStockPositionService {

    /**
     * 缓存管理器
     */
    @Autowired
    private RedisCacheManager redisCacheManager;

    /**
     * 持仓的数据层接口
     */
    @Autowired
    private ITradePositionDao tradePositionDao;


    /**
     * 获取用户的所有持仓数据
     * @param accountId
     * @return
     */
    @Override
    public List<TradePosition> getAllPositions(Long accountId) {
        // 根据账户ID获取所有持仓数据信息
        List<TradePosition> positionList = tradePositionDao.getAllByAccountId(accountId);
        if(null != positionList) {
            positionList.forEach(pos -> {
                // 计算浮动盈亏
                calcProfit(pos);
            });
        }
        return positionList;
    }

    /**
     * 计算仓位的浮动盈亏
     * @param pos
     */
    private void calcProfit(TradePosition pos) {
        // 1. 获取最新的行情报价
        TradeStockQuoteLast quoteLast = getTradeStockQuoteLast(pos.getStockId());
        if(null != quoteLast) {
            // 采用长整型做计算, 保留两位小数
            // 浮动盈亏计算: 浮动盈亏 = (最新价 - 成本价) * 持仓数量
            long diffPrice = MathUtils.sub(quoteLast.getLastPrice(), pos.getCostPrice());
            long profit = MathUtils.mul(diffPrice, pos.getVolume());
            pos.setProfit(profit);
            pos.setLastPrice(quoteLast.getLastPrice());
            // 浮动盈亏的比例(采用长整型, 保留四位小数, 1699988 -> 169.9988%)
            // 计算公式:  盈亏比例 = 浮动盈亏 / (成本价 * 持仓数量)
            pos.setProfitRate(MathUtils.div2Long(profit, MathUtils.mul(pos.getCostPrice(), pos.getVolume()), 4));
        }

    }

    /**
     * 获取股票产品的最新报价
     * @param stockId
     * @return
     */
    private TradeStockQuoteLast getTradeStockQuoteLast(Long stockId) {
        // 从缓存对象获取数据
        Cache lastPriceCache = redisCacheManager.getCache(GlobalConstants.STOCK_QUOTE_LAST_PRICE_KEY);
        Cache.ValueWrapper quoteLastWrapper = lastPriceCache.get(stockId);
        TradeStockQuoteLast quoteLast = null;
        if(null != quoteLastWrapper) {
            quoteLast = (TradeStockQuoteLast) quoteLastWrapper.get();
        }
        return quoteLast;

    }
}
