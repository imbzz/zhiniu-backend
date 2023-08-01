package com.itcast.bulls.stock.deal.dao.trade;

import com.itcast.bulls.stock.entity.trade.TradeDeal;
import org.springframework.stereotype.Repository;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@Repository
public interface ITradeDealDao {

    /**
     * 保存成交记录信息
     * @param record
     * @return
     */
    int insert(TradeDeal record);
}
