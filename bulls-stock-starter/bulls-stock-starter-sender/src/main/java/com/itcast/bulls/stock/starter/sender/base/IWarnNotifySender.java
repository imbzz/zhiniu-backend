package com.itcast.bulls.stock.starter.sender.base;

import com.itcast.bulls.stock.starter.sender.vo.SenderMessage;
import com.itcast.bulls.stock.starter.sender.vo.SenderResult;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
public interface IWarnNotifySender {

    /**
     * 发送预警通知(异步方式)
     * @param receiver
     * @param subject
     * @param content
     * @return
     */
    public SenderResult sendMessage(SenderMessage notifyMessage);

    /**
     * 同步方式发送消息
     * @param senderMessage
     * @return
     */
    public SenderResult sendSyncMessage(SenderMessage senderMessage);

}
