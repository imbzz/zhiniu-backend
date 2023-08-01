package com.itcast.bulls.stock.task.dao.trade;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.itcast.bulls.stock.entity.trade.TradePosition;


@Repository
public interface ITradePositionDao {

    /**
     * 新增记录
     * @param record
     * @return
     */
    int insert(TradePosition record);


    /**
     * 根据账户和股票产品ID获取仓位信息
     * @param accountId
     * @param stockId
     * @return
     */
    TradePosition getByAccountIdAndStockId(@Param("accountId") long accountId, @Param("stockId") long stockId);

    /**
     * 更新持仓信息
     * @param record
     * @return
     */
    int update(TradePosition record);

    /**
     * 更新持仓利息
     * @param record
     * @return
     */
    int updateInterest(TradePosition record);

    /**
     * 根据账户ID获取所有有效的持仓数据
     * @param accountId
     * @return
     */
    List<TradePosition> getAllByAccountId(@Param("accountId") long accountId);


    /**
     * 获取所有有效的持仓数据(每次限制2000条)
     * @return
     */
    List<TradePosition> findAllValidPositionsByInterestTime(@Param("interestTime") String interestTime);


}