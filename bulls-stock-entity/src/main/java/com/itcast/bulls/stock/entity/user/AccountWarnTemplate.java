package com.itcast.bulls.stock.entity.user;

import com.itcast.bulls.stock.entity.base.BaseEntity;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;

/**
 * 
 * 账户预警通知模板
 *
 */
@Api(value = "HATEOAS接口-客户消息模板配置管理(AccountWarnTemplate)")
@Entity
@Table(name="t_account_warn_template")
@Data
@ApiModel("AccountWarnTemplate(用户预警通知模板)")
public class AccountWarnTemplate extends BaseEntity {


    /**
     * 预警类型 (0: 止损, 1:止盈)
     */
    @ApiModelProperty(value="消息类型 (0: 止损, 1:止盈)", required = true)
    private Integer warnType;

    /**
     * 通知方式(APP:站内信，EMAIL：邮件，SMS：短信， 多个以逗号分隔)
     */
    @ApiModelProperty(value="通知方式(APP:站内信，EMAIL：邮件，SMS：短信)", required = true)
    private String notifyType;

    /**
     * 模板内容
     */
    @ApiModelProperty(value="消息正文", required = true)
    private String content;

    /**
     * 消息标题
     */
    @ApiModelProperty(value="消息标题", required = true)
    private String title;

    /**
     * 消息状态（0：启用， 1： 禁用）
     */
    @ApiModelProperty(value="消息状态（0：启用， 1： 禁用）", required = true)
    private Integer status;

    /**
     * 最后跟新人id
     */
    @ApiModelProperty(hidden = true)
    private Long lastUpdateBy;

    /**
     * 最后更新人名称
     */
    @ApiModelProperty(hidden = true)
    private String lastUpdateUser;

    /**
     * 创建时间
     */
    @ApiModelProperty(hidden = true)
    private Date createTime;

    /**
     * 更新时间
     */
    @ApiModelProperty(hidden = true)
    private Date updateTime;

    /**
     */
    private static final long serialVersionUID = 1L;
}