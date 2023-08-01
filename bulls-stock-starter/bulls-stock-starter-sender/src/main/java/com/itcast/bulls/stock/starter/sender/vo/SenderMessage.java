package com.itcast.bulls.stock.starter.sender.vo;

import lombok.Data;

import java.util.Date;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@Data
public class SenderMessage {

    private Long id;

    /**
     * 交易账号ID
     */
    private Long accountId;
    /**
     * 发送邮件主题
     */
    private String subject;

    /**
     * 接收者地址
     */
    private String receiver;

    /**
     * 通知内容
     */
    private String notifyContent;

    /**
     * 更新时间
     */
    private Date updateTime;
}
