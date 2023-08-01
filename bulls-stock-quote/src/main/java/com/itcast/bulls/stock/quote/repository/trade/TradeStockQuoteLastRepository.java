package com.itcast.bulls.stock.quote.repository.trade;

import com.itcast.bulls.stock.entity.quote.TradeStockQuoteLast;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 * <p>Description: 股票分时行情报价数据接口 </p>
 */
@Repository
public interface TradeStockQuoteLastRepository  extends PagingAndSortingRepository<TradeStockQuoteLast, Long>, JpaSpecificationExecutor<TradeStockQuoteLast> {

    /**
     * 根据股票ID和时间戳获取对象
     * @param stockId
     * @param time
     * @return
     */
    TradeStockQuoteLast getDistinctByStockIdAndTime(@Param("stockId") Long stockId, @Param("time") Long time);
}
