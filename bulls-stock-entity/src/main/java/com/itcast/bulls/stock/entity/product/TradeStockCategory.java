package com.itcast.bulls.stock.entity.product;

import com.itcast.bulls.stock.entity.base.BaseEntity;
import io.swagger.annotations.Api;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 
 * t_trade_stock_category
 *
 */
@Api(value = "HATEOAS接口-产品分类管理(TradeStockCategory)")
@Entity
@Table(name="t_trade_stock_category")
@Data
public class TradeStockCategory extends BaseEntity {


    private static final long serialVersionUID = 1L;

    /**
     * 名称
     */
    private String name;

    /**
     * 分类编号
     */
    private String code;

    /**
     * 状态(0:启用， 1：禁用）
     */
    private Integer status;

    /**
     * 交易开始时间(分钟)
     */
    private Long startMins;

    /**
     * 交易结束时间（分钟）
     */
    private Long endMins;


    /**
     * 交易佣金比例（保留四位小数）
     */
    private Long commissionRate;


}