package com.itcast.trade.bulls.stock.user.dao;

import com.itcast.bulls.stock.entity.user.TradeAccount;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@Repository
public interface ITradeAccountDao {

    /**
     * 新增交易账号信息
     * @param record
     * @return
     */
    int insert(TradeAccount record);


    /**
     * 根据账号编号获取交易用户对象
     * @param accountNo
     * @return
     */
    TradeAccount getByAccountNo(@Param("accountNo") String accountNo);
}
