package com.itcast.bulls.stock.starter.sender.service;

import com.aliyuncs.CommonRequest;
import com.aliyuncs.CommonResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.exceptions.ServerException;
import com.aliyuncs.http.MethodType;
import com.itcast.bulls.stock.common.generator.DateUtils;
import com.itcast.bulls.stock.common.json.GsonConvertUtil;
import com.itcast.bulls.stock.starter.sender.base.AliyunSender;
import com.itcast.bulls.stock.starter.sender.base.IWarnNotifySender;
import com.itcast.bulls.stock.starter.sender.vo.SenderMessage;
import com.itcast.bulls.stock.starter.sender.vo.SenderResult;
import lombok.extern.log4j.Log4j;
import org.springframework.scheduling.annotation.Async;

import java.util.HashMap;
import java.util.Map;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@Log4j
public class SmsSender extends AliyunSender implements IWarnNotifySender {

    private final static String DOMAIN = "dysmsapi.aliyuncs.com";
    private final static String VERSION = "2017-05-25";
    private final static String ACTION_SENDSMS = "SendSms";


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
    public SenderResult sendMessage(SenderMessage notifyMessage) {

        CommonRequest request = new CommonRequest();
        request.setMethod(MethodType.POST);
        request.setDomain(DOMAIN);
        request.setVersion(VERSION);
        request.setAction(ACTION_SENDSMS);
        request.putQueryParameter("RegionId", getRegionId());
        request.putQueryParameter("PhoneNumbers", notifyMessage.getReceiver());
        request.putQueryParameter("SignName", getSmsSignName());
        request.putQueryParameter("TemplateCode", getSmsTemplateCode());
        // 模板参数使用举例：
        //尊敬的${name}用户，您的快递将会在${time}时间到达，快递价格为${price}， 请您准备签收。
        //变量属性:
        //name-其他；time-时间；price-金额；
        Map<String, String> params = new HashMap<>();
        params.put("name", notifyMessage.getReceiver());
        params.put("time", DateUtils.getFmtDatetime(notifyMessage.getUpdateTime()));
        params.put("price", "100");
        request.putQueryParameter("TemplateParam", GsonConvertUtil.getSingleton().cvtObj2Json(params));
        SenderResult result = new SenderResult();
        result.setId(notifyMessage.getId());
        try {
            CommonResponse response = client.getCommonResponse(request);
            String resultCode = GsonConvertUtil.getSingleton().getJsonProp(response.getData(), "Code");
            result.setSendStatus(resultCode);
        } catch (ServerException e) {
            log.error("errorCode: " +  e.getErrCode() + ", errorMsg: " + e.getMessage(), e);
            result.setSendStatus(e.getErrCode());
            result.setMemo(e.getMessage());
        } catch (ClientException e) {
            log.error("errorCode: " +  e.getErrCode() + ", errorMsg: " + e.getMessage(), e);
            result.setSendStatus(e.getErrCode());
            result.setMemo(e.getMessage());
        }
        return result;
    }
}