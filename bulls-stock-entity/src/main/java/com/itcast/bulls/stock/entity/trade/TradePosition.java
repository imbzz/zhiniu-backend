package com.itcast.bulls.stock.entity.trade;

import com.itcast.bulls.stock.entity.base.BaseEntity;
import io.swagger.annotations.Api;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;

/**
 * 
 * t_trade_position: 仓位表
 *
 */
@Api(value = "HATEOAS接口-仓位管理(TradePosition)")
@Entity
@Table(name="t_trade_position")
@Data
public class TradePosition extends BaseEntity {

    /**
     */
    private static final long serialVersionUID = 1L;

    /**
     * 交易账号ID
     */
    private Long accountId;

    /**
     * 交易账号编号
     */
    private String accountNo;

    /**
     * 股票ID
     */
    private Long stockId;

    /**
     * 股票代码
     */
    private String stockCode;

    /**
     * 股票名称
     */
    private String stockName;


    /**
     * 成本价
     */
    private Long costPrice;

    /**
     * 持仓数量
     */
    private Integer volume;

    /**
     * 股票市场(0: 上交所， 1：深交所，2：港股， 3：美股）
     */
    private Integer stockMarket;

    /**
     * 成交均价
     */
    private Long avgPrice;

    /**
     * 可卖数量(T+1制度使用)
     */
    private Integer validSellVolume;

    /**
     * 盈亏(默认两位小数)
     */
    private Long profit;

    /**
     * 成交时间
     */
    private Date execTime;

    /**
     * 状态(0:有效，1：无效）
     */
    private Integer status;

    /**
     * 持仓累计利息（默认两位小数）
     */
    private Long interest;

    /**
     * 利息更新时间
     */
    private String interestTime;


    /**
     * 最新价（冗余）
     */
    @Transient
    private Long lastPrice;

    /**
     * 盈亏比例（冗余）
     */
    @Transient
    private Long profitRate;


}