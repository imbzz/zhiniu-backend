package com.itcast.bulls.stock.finance.vo;

import lombok.Data;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@Data
public class AccountOverviewVo {

    /**
     * 总持仓盈亏
     */
    private long positionProfit;

    /**
     * 当日持仓盈亏
     */
    private long dayProfit;

    /**
     * 总市值
     */
    private long totalMarketAmount;

    /**
     * 总资产
     */
    private long totalAssets;

    /**
     * 账户余额
     */
    private long balance;
}
