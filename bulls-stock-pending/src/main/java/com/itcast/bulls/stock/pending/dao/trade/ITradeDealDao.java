package com.itcast.bulls.stock.pending.dao.trade;

import org.springframework.stereotype.Repository;

import com.itcast.bulls.stock.entity.trade.TradeDeal;


@Repository
public interface ITradeDealDao {

    /**
     * 创建订单数据, 生成订单信息
     * @param record
     * @return
     */
    int insert(TradeDeal record);
}