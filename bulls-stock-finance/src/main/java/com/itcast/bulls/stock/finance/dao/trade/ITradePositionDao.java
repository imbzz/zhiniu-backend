package com.itcast.bulls.stock.finance.dao.trade;

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
     * 根据账户ID获取所有有效的持仓数据
     * @param accountId
     * @return
     */
    List<TradePosition> getAllByAccountId(@Param("accountId") long accountId);

}