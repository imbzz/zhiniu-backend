package com.itcast.bulls.stock.quote.repository.trade;

import com.itcast.bulls.stock.entity.quote.TradeStockQuoteSummary;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

/**
 * <p>Description: 股票报价概要数据接口 </p>
 */
@Repository
public interface TradeStockQuoteSummaryRepository extends PagingAndSortingRepository<TradeStockQuoteSummary, Long>, JpaSpecificationExecutor<TradeStockQuoteSummary> {

}
