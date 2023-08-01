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
@Api(value = "HATEOAS接口-订单管理(TradeOrder)")
@Entity
@Table(name="t_trade_order")
@Data
public class TradeOrder extends BaseEntity {

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
     *
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
     * 状态(0:待成交, 1:部分成交， 2：完全成交, 3:手工撤单， 4:系统撤单)
     */
    private Integer status;

    /**
     * 挂单类型(0:市价单， 1:限价单)
     */
    private Integer type;

    /**
     * 买卖方向
     */
    private Integer direction;

    /**
     * 挂单的数量
     */
    private Integer initVolume;

    /**
     * 成交数量
     */
    private Integer execVolume;

    /**
     * 成交价格
     */
    private Long execPrice;

    /**
     * 请求价格
     */
    private Long requestPrice;

    /**
     * 成交时间
     */
    private Date execTime;


}