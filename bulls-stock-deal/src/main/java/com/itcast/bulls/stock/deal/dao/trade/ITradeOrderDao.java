package com.itcast.bulls.stock.deal.dao.trade;

import com.itcast.bulls.stock.entity.trade.TradeOrder;
import org.springframework.stereotype.Repository;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
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
    TradeOrder getById(Long id);
}
