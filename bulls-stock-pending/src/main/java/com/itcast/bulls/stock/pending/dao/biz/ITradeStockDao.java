package com.itcast.bulls.stock.pending.dao.biz;


import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Repository;

import com.itcast.bulls.stock.common.utils.GlobalConstants;
import com.itcast.bulls.stock.entity.product.TradeStock;


@Repository
public interface ITradeStockDao {



    @Cacheable(value= GlobalConstants.STOCK_PRODUCT_KEY)
    public TradeStock getById(Long id);

}