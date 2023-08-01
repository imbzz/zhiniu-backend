package com.itcast.bulls.stock.quote.repository.biz;

import com.itcast.bulls.stock.entity.product.TradeStock;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>Description: 产品管理数据层接口 </p>
 */
@Repository
public interface TradeStockRepository  extends PagingAndSortingRepository<TradeStock, Long>, JpaSpecificationExecutor<TradeStock> {

    TradeStock findByCode(@Param("code") String code);

    List<TradeStock> findByCategoryId(@Param("categoryId") Long categoryId);

    List<TradeStock> findAllByStatus(@Param("status") int status);
}
