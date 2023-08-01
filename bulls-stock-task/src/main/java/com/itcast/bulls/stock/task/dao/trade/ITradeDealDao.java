package com.itcast.bulls.stock.task.dao.trade;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.itcast.bulls.stock.entity.trade.TradeDeal;


@Repository
public interface ITradeDealDao {

    /**
     * 创建简易订单
     * @param record
     * @return
     */
    int insert(TradeDeal record);

    /**
     * 根据账户获取指定时间的交易记录
     * @param stockId
     * @param beginTime
     * @param endTime
     * @return
     */
    List<TradeDeal> getTradeDealByAcountAndTime(@Param("accountId") Long accountId, @Param("beginTime") Timestamp beginTime, @Param("endTime") Timestamp endTime);

    /**
     * 根据指定时间范围获取交易记录
     * @param beginTime
     * @param endTime
     * @return
     */
    List<TradeDeal> getTradeDealByTime(@Param("beginTime") Timestamp beginTime, @Param("endTime") Timestamp endTime);

}