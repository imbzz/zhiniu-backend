package com.itcast.bulls.stock.entity.user;

import com.itcast.bulls.stock.entity.base.BaseEntity;
import lombok.Data;

import java.util.Date;

/**
 * 账户预警设置表
 * 
 * office.t_account_warn_setting
 *
 */
@Data
public class AccountWarnSetting extends BaseEntity {

    /**
     */
    private static final long serialVersionUID = 1L;

    /**
     * 主键标识
     */
    private Long id;

    /**
     * 账户ID
     */
    private Long accountId;

    /**
     * 股票产品ID
     */
    private Long stockId;

    /**
     * 预警类型 (0: 止损, 1:止盈)
     */
    private Integer warnType;

    /**
     * 止盈止损设置比例(单位：%， 例2.28 代表02.28%)
     */
    private Double stopRate;

    /**
     * 通知方式(APP:站内信，EMAIL：邮件，SMS：短信， 多个以逗号分隔)
     */
    private String notifyType;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 更新时间
     */
    private Date updateTime;

}