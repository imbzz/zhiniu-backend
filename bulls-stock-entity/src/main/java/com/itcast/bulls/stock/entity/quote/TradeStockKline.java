package com.itcast.bulls.stock.entity.quote;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

/**
 *
 *  股票K线表
 *
 */
@Entity
@Table(name="t_trade_stock_kline")
@Data
public class TradeStockKline implements Serializable {

    /**
     */
    private static final long serialVersionUID = -1L;


    @Id
    @ApiModelProperty(hidden = true)
    private Long id;


    /**
     * 产品ID
     */
    @Column(name="stockid")
    private Long stockId;

    /**
     * 产品编号
     */
    @Column(name="stockcode")
    private String stockCode;

    /**
     * 产品名称
     */
    @Column(name="stockname")
    private String stockName;

    /**
     * 开盘价
     */
    @Column(name="priceopen")
    private Long priceOpen;

    /**
     * 最高价
     */
    @Column(name="pricehigh")
    private Long priceHigh;

    /**
     * 最低价
     */
    @Column(name="pricelow")
    private Long priceLow;

    /**
     * 收盘价
     */
    @Column(name="priceclose")
    private Long priceClose;

    /**
     * 成交量
     */
    private Long volume;

    /**
     * 成交金额
     */
    private Long amount;

    /**
     * 报价时间
     */
    private Long time;


    /**
     * 昨收价
     */
    @Column(name="lastcloseprice")
    private Long lastClosePrice;

    /**
     * 类型, 生成K线的时间周期(1: 1分钟, 5: 5分钟, 30: 30分钟)
     */
    @Column(name="datatype")
    private Integer dataType;



}