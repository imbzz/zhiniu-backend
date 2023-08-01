package com.itcast.bulls.stock.entity.finance;

import com.itcast.bulls.stock.entity.base.BaseEntity;
import lombok.Data;

import java.util.Date;

/**
 * 
 * 账户交割单实体
 *
 */
@Data
public class TradeAccountSettlement extends BaseEntity {

    /**
     */
    private static final long serialVersionUID = 1L;

    /**
     * 主键标识
     */
    private Long id;

    /**
     * 用户ID
     */
    private Long userId;

    /**
     * 成交记录ID
     */
    private Long dealId;

    /**
     * 交易账号ID
     */
    private Long accountId;

    /**
     * 交易时间
     */
    private Date tradeTime;

    /**
     * 股票ID
     */
    private Long stockId;

    /**
     * 股票代码
     */
    private String stockCode;

    /**
     * 币种
     */
    private String currency;

    /**
     * 买卖方向
     */
    private Integer direction;

    /**
     * 交易金额
     */
    private Long tradeAmount;

    /**
     * 交易数量
     */
    private Long tradeVolume;

    /**
     * 交易价格
     */
    private Long tradePrice;

    /**
     * 税费（印花税+过户费+交易规费）
     */
    private Long taxes;

    /**
     * 佣金
     */
    private Long commission;

    /**
     * 状态(0:有效， 1：锁定， 2：禁用）
     */
    private Integer status;

    /**
     * 创建时间
     */
    private Date createTime;


}