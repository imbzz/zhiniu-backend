package com.itcast.bulls.stock.entity.trade;

import com.itcast.bulls.stock.entity.base.BaseEntity;
import io.swagger.annotations.Api;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@Api(value = "HATEOAS接口-成交记录管理(TradeDeal)")
@Entity
@Table(name="t_trade_deal")
@Data
public class TradeDeal extends BaseEntity {

    /**
     */
    private static final long serialVersionUID = 1L;

    /**
     * 交易订单号
     */
    private Long tradeOrderId;

    /**
     * 持仓ID
     */
    private Long positionId;

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
     * 股票市场(0: 上交所， 1：深交所，2：港股， 3：美股）
     */
    private Integer stockMarket;

    /**
     * 成交数量
     */
    private Integer execVolume;

    /**
     * 成交价格
     */
    private Long execPrice;

    /**
     * 成交时间
     */
    private Date execTime;

    /**
     * 买卖方向
     */
    private Integer direction;

    /**
     * 盈亏
     */
    private Long profit;

    /**
     * 佣金
     */
    private Long commission;

    /**
     * 税费
     */
    private Long taxes;

    /**
     * 状态(0:有效，1：无效）
     */
    private Integer status;

}