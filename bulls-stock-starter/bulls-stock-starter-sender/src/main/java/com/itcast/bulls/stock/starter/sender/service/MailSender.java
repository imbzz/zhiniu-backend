package com.itcast.bulls.stock.starter.sender.service;

import com.aliyuncs.dm.model.v20151123.SingleSendMailRequest;
import com.aliyuncs.dm.model.v20151123.SingleSendMailResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.exceptions.ServerException;
import com.itcast.bulls.stock.common.utils.GlobalConstants;
import com.itcast.bulls.stock.starter.sender.base.AliyunSender;
import com.itcast.bulls.stock.starter.sender.base.IWarnNotifySender;
import com.itcast.bulls.stock.starter.sender.vo.SenderMessage;
import com.itcast.bulls.stock.starter.sender.vo.SenderResult;
import lombok.extern.log4j.Log4j2;
import org.springframework.scheduling.annotation.Async;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@Log4j2
public class MailSender extends AliyunSender implements IWarnNotifySender {


    /**
     * 同步方式发送消息
     * @param senderMessage
     * @return
     */
    @Override
    public SenderResult sendSyncMessage(SenderMessage senderMessage) {
        return sendMessage(senderMessage);
    }

    /**
     * 发送预警通知
     * @param receiver
     * @param subject
     * @param content
     * @return
     */
    @Override
    @Async
    public SenderResult sendMessage(SenderMessage senderMessage) {
        SingleSendMailRequest request = new SingleSendMailRequest();
        SenderResult result = new SenderResult();
        result.setId(senderMessage.getId());
        try {
            request.setAccountName(getMailAccount());
            request.setFromAlias("mirson.ho");
            request.setAddressType(1);
            request.setTagName(senderMessage.getSubject());
            request.setReplyToAddress(true);
            request.setToAddress(senderMessage.getReceiver());
            //可以给多个收件人发送邮件，收件人之间用逗号分开，批量发信建议使用BatchSendMailRequest方式
            request.setSubject(senderMessage.getSubject());
            request.setHtmlBody(senderMessage.getNotifyContent());
            //如果调用成功，正常返回httpResponse；如果调用失败则抛出异常，需要在异常中捕获错误异常码；错误异常码请参考对应的API文档;
            SingleSendMailResponse httpResponse = client.getAcsResponse(request);
            result.setSendStatus(GlobalConstants.STATUS_OK);
        } catch (ServerException e) {
            //捕获错误异常码
            log.error("errorCode: " +  e.getErrCode() + ", errorMsg: " + e.getMessage(), e);
            result.setSendStatus(e.getErrCode());
            result.setMemo(e.getMessage());
        } catch (ClientException e) {
            //捕获错误异常码
            log.error("errorCode: " +  e.getErrCode() + ", errorMsg: " + e.getMessage(), e);
            result.setSendStatus(e.getErrCode());
            result.setMemo(e.getMessage());
        }
        return result;
    }

}