package com.itcast.bulls.stock.task.dao.biz;


import org.springframework.stereotype.Repository;

import com.itcast.bulls.stock.entity.finance.TradeAccountSettlement;


@Repository
public interface ITradeAccountSettlementDao {

    /**
     * 新增数据
     * @param record
     * @return
     */
    int insert(TradeAccountSettlement record);

    /**
     * 根据交易记录ID判断记录是否存在
     * @param dealId
     * @return
     */
    Integer checkExistsByDealId(Long dealId);

}