package com.itcast.bulls.stock.finance.service;

import com.itcast.bulls.stock.common.exception.ComponentException;
import com.itcast.bulls.stock.entity.finance.TradeAccountSettlement;
import com.itcast.bulls.stock.finance.vo.AccountOverviewVo;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
public interface IStockFinanceService {

    /**
     * 计算账户总览信息
     * @param accountId
     * @return
     */
    AccountOverviewVo calcAccountSummary(long accountId)  throws ComponentException;

    /**
     * 更新账户资金余额
     * @param accountId
     * @param adjustBalance
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    long updateBalance(long accountId, long adjustBalance) throws ComponentException ;

    /**
     * 获取账户资金的余额
     * @param accountId
     * @return
     */
    long getBalance(long accountId) throws ComponentException;

    /**
     * 获取账户的交割单数据
     * @param accountId
     * @param timeStart
     * @param timeEnd
     * @return
     */
    List<TradeAccountSettlement> getTradeAccountSettlements(long accountId, long timeStart, long timeEnd) throws ComponentException;
}
