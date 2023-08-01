package com.itcast.bulls.stock.finance.dao.trade;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.itcast.bulls.stock.entity.trade.TradeOrder;


@Repository
public interface ITradeOrderDao {

    /**
     * 新增记录
     * @param record
     * @return
     */
    int insert(TradeOrder record);

    /**
     * 根据ID获取订单
     * @param id
     * @return
     */
    TradeOrder getById(@Param("id") Long id);

    /**
     * 更新订单信息
     * @param order
     * @return
     */
    int update(TradeOrder order);

    /**
     * 修改订单状态
     * @param id
     * @return
     */
    int updateOrderStatusById(@Param("id") Long id, @Param("status") int status);



}