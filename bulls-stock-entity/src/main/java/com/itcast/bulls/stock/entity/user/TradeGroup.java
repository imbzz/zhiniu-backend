package com.itcast.bulls.stock.entity.user;

import com.itcast.bulls.stock.entity.base.BaseEntity;
import io.swagger.annotations.Api;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;

/**
 * 
 * t_trade_group
 *
 */
@Api(value = "HATEOAS接口-客户组管理(TradeGroup)")
@Entity
@Table(name="t_trade_group")
@Data
public class TradeGroup extends BaseEntity {

    /**
     */
    private static final long serialVersionUID = 1L;


    /**
     * 账户组编号
     */
    private String groupNo;

    /**
     * 账户组名称
     */
    private String groupName;

    /**
     * 交易币种（CNY:人民币， HKD：港币，USD：美元）
     */
    private String currency;

    /**
     * 公司ID
     */
    private Long companyId;

    /**
     * 公司名称
     */
    private String companyName;

    /**
     * 佣金比例， 单位：%
     */
    private Double commissionRate;

    /**
     * 税费比例， 单位：%
     */
    private Double taxesRate;

    /**
     * 账户等级（0：普通，1：VIP）
     */
    private Integer level;

    /**
     * 状态(0:启用， 1：禁用）
     */
    private Integer status;

    /**
     * 创建时间
     */
    private Date craeteTime;



}