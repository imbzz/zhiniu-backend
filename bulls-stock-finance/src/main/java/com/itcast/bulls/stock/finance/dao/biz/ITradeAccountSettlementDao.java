package com.itcast.bulls.stock.finance.dao.biz;


import com.itcast.bulls.stock.entity.finance.TradeAccountSettlement;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface ITradeAccountSettlementDao {

    /**
     * 新增账户交割单数据
     * @param record
     * @return
     */
    int insert(TradeAccountSettlement record);

    /**
     * 获取指定时间范围的交割单数据
     * @param accountId
     * @param timeStart
     * @param timeEnd
     * @return
     */
    List<TradeAccountSettlement> getSettlementsByTimeRange(@Param("accountId") Long accountId, @Param("timeStart") String timeStart, @Param("timeEnd") String timeEnd);

}