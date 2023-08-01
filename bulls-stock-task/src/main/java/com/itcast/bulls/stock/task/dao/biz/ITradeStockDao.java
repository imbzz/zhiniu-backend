package com.itcast.bulls.stock.task.dao.biz;


import java.util.List;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Repository;

import com.itcast.bulls.stock.common.utils.GlobalConstants;
import com.itcast.bulls.stock.entity.product.TradeStock;


@Repository
public interface ITradeStockDao {



    @Cacheable(value= GlobalConstants.STOCK_PRODUCT_KEY)
    public TradeStock getById(Long id);

    /**
     * 获取所有有效的股票产品数据
     * @return
     */
    public List<TradeStock> getAllValidStocks();

}