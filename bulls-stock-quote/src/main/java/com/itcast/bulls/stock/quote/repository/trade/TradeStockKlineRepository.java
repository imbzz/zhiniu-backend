package com.itcast.bulls.stock.quote.repository.trade;

import com.itcast.bulls.stock.common.utils.GlobalConstants;
import com.itcast.bulls.stock.entity.quote.TradeStockKline;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>Description:  股票K线数据接口</p>
 */
@Repository
public interface TradeStockKlineRepository  extends PagingAndSortingRepository<TradeStockKline, Long>, JpaSpecificationExecutor<TradeStockKline> {

    /**
     * 保存K线数据
     * @param entity
     * @param <S>
     * @return
     */
    @Override
    @CacheEvict(GlobalConstants.STOCK_QUOTE_KLINE_KEY)
    <S extends TradeStockKline> S save(S entity);

    /**
     * 根据时间段范围查询K线数据
     * @param stockCode
     * @param begin
     * @param end
     * @return
     */
    @Cacheable(value=GlobalConstants.STOCK_QUOTE_KLINE_KEY)
    List<TradeStockKline> findAllByStockCodeAndTimeBetween(String stockCode, Long begin, Long end);

}
