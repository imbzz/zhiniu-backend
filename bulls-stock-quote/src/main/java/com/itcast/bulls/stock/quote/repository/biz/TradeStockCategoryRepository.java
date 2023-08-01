package com.itcast.bulls.stock.quote.repository.biz;

import com.itcast.bulls.stock.entity.product.TradeStockCategory;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 * <p>Description: 产品分类管理数据层接口  </p>
 */
@Repository
public interface TradeStockCategoryRepository extends PagingAndSortingRepository<TradeStockCategory, Long>, JpaSpecificationExecutor<TradeStockCategory> {

    TradeStockCategory findByCode(@Param("code") String code);
}
