package com.itcast.bulls.stock.deal.dao.trade;

import com.itcast.bulls.stock.entity.trade.TradePosition;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;


@Repository
public interface ITradePositionDao {

    /**
     * 新增记录
     * @param record
     * @return
     */
    int insert(TradePosition record);


    /**
     * 更新持仓信息
     * @param record
     * @return
     */
    int update(TradePosition record);


    /**
     * 根据账户和股票产品ID获取仓位信息
     * @param accountId
     * @param stockId
     * @return
     */
    TradePosition getByAccountIdAndStockId(@Param("accountId") long accountId, @Param("stockId") long stockId);


}