package com.itcast.bulls.stock.entity.quote;

import com.itcast.bulls.stock.entity.base.BaseEntity;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * 
 *  股票分时行情报价表
 *
 */
@Entity
@Table(name="t_trade_stock_quote_last")
@Data
public class TradeStockQuoteLast extends BaseEntity {

    /**
     */
    private static final long serialVersionUID = -1L;

    /**
     * 产品ID
     */
    private Long stockId;

    /**
     * 产品编号
     */
    private String stockCode;

    /**
     * 产品名称
     */
    private String stockName;

    /**
     * 买方报价（一档）
     */
    private Long priceBid1;

    /**
     * 买方报价（二档）
     */
    private Long priceBid2;

    /**
     * 买方报价（三档）
     */
    private Long priceBid3;

    /**
     * 买方报价（四档）
     */
    private Long priceBid4;

    /**
     * 买方报价（五档）
     */
    private Long priceBid5;

    /**
     * 买方数量（一档）
     */
    private Long volumeBid1;

    /**
     * 买方数量（二档）
     */
    private Long volumeBid2;

    /**
     * 买方数量（三档）
     */
    private Long volumeBid3;

    /**
     * 买方数量（四档）
     */
    private Long volumeBid4;

    /**
     * 买方数量（五档）
     */
    private Long volumeBid5;

    /**
     * 卖方报价（一档）
     */
    private Long priceAsk1;

    /**
     * 卖方报价（二档）
     */
    private Long priceAsk2;

    /**
     * 卖方报价（三档）
     */
    private Long priceAsk3;

    /**
     * 卖方报价（四档）
     */
    private Long priceAsk4;

    /**
     * 卖方报价（五档）
     */
    private Long priceAsk5;

    /**
     * 卖方数量（一档）
     */
    private Long volumeAsk1;

    /**
     * 卖方数量（二档）
     */
    private Long volumeAsk2;

    /**
     * 卖方数量（三档）
     */
    private Long volumeAsk3;

    /**
     * 卖方数量（四档）
     */
    private Long volumeAsk4;

    /**
     * 卖方数量（五档）
     */
    private Long volumeAsk5;

    /**
     * 当前价格
     */
    private Long lastPrice;

    /**
     * 当前成交量
     */
    private Long volume;

    /**
     * 当前成交金额
     */
    private Long amount;

    /**
     * 开盘价
     */
    private Long openPrice;

    /**
     * 昨收价
     */
    private Long lastClosePrice;


    /**
     * 报价时间
     */
    private Long time;

    @Transient
    private AtomicInteger count = new AtomicInteger();

    /**
     * 股票市场
     */
    @Transient
    private Integer marketNo;

    /**
     * 行情涨跌幅比例(单位：%， 例2.28 代表02.28%)
     */
    @Transient
    private Double priceRate;




}