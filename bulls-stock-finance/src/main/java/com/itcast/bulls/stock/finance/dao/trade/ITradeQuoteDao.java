package com.itcast.bulls.stock.finance.dao.trade;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * <p>Description: </p>
 * @date 2019/8/21
 * @author 贺锟 
 * @version 1.0
 * @name  Mirson
 * <p>Copyright:Copyright(c)2019</p>
 */
@Repository
public interface ITradeQuoteDao {

    // 获取昨日收盘价格
    Long getLastPrice(@Param("stockId") Long stockId, @Param("beginTime") Long beginTime, @Param("endTime") Long endTime);
}
