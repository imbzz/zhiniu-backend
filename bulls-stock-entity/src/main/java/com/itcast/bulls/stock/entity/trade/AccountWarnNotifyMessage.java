package com.itcast.bulls.stock.entity.trade;

import com.itcast.bulls.stock.entity.base.BaseEntity;
import io.swagger.annotations.Api;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;

/**
 * 账户预警通知记录表
 * 
 * office.t_account_warn_notify_message
 *
 */
@Api(value = "HATEOAS接口-客户消息管理(AccountWarnNotifyMessage)")
@Entity
@Table(name="t_account_warn_notify_message")
@Data
public class AccountWarnNotifyMessage extends BaseEntity {

    /**
     */
    private static final long serialVersionUID = 1L;

    /**
     * 用户ID
     */
    private Long userId;

    /**
     * 用户编号
     */
    private String userNo;

    /**
     * 用户姓名
     */
    private String userName;

    /**
     * 账户ID
     */
    private Long accountId;

    /**
     * 接收者地址
     */
    private String receiver;

    /**
     * 通知方式(APP:站内信，EMAIL：邮件，SMS：短信， 多个以逗号分隔)
     */
    private String notifyType;

    /**
     * 预警消息类型 (0: 止损, 1:止盈)
     */
    private Integer warnType;

    /**
     * 通知内容
     */
    private String notifyContent;

    /**
     * 通知标题
     */
    private String notifyTitle;

    /**
     * 发送状态（成功为200， 失败为错误码）
     */
    private String sendStatus;

    /**
     * 重试次数，默认重发3次
     */
    private Integer retryTimes;

    /**
     * 备注，如果失败， 记录异常信息
     */
    private String memo;

    /**
     * 更新时间
     */
    private Date updateTime;

}