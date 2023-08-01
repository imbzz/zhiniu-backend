package com.itcast.bulls.stock.pending.vo;

import lombok.Data;

import java.io.Serializable;


@Data
public class LimitPlaceOrderRequestVo implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 账号ID
     */
    private Long accountId;
    /**
     * 股票产品ID
     */
    private Long stockId;
    /**
     * 买卖方向
     */
    private Integer direction ;
    /**
     * 订单类型
     */
    private Integer type;
    /**
     * 请求数量
     */
    private Integer execVolume;
    /**
     * 请求价格
     */
    private Long execPrice;

    /**
     * 请求时间（服务端接收到的时刻）
     */
    private Long execTime;

    /**
     * 订单ID (冗余）
     */
    private Long orderId;
}
