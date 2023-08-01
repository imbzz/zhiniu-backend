package com.itcast.bulls.stock.starter.sender;

import com.itcast.bulls.stock.starter.sender.service.MailSender;
import com.itcast.bulls.stock.starter.sender.service.SmsSender;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@Configuration
@EnableAutoConfiguration
@ConditionalOnProperty(name = "aliyun.sender.accessKey")
@Log4j2
public class AutoStockSenderConfiguration {

    /**
     * 区域信息
     */
    @Value("${aliyun.sender.regionId}")
    private String regionId;

    /**
     * 访问key
     */
    @Value("${aliyun.sender.accessKey}")
    private String accessKey;

    /**
     * 授权密钥
     */
    @Value("${aliyun.sender.secret}")
    private String secret;

    /**
     * 邮箱帐号
     */
    @Value("${aliyun.sender.mailAccount}")
    private String mailAccount;

    /**
     * 短信模板编号, 需在阿里云上预先配置
     */
    @Value("${aliyun.sender.smsTemplateCode}")
    private String smsTemplateCode;

    /**
     * 短信签名
     */
    @Value("${aliyun.sender.smsSignName}")
    private String smsSignName;


    /**
     * 创建邮件发送实现类
     * @return
     */
    @Bean(name = "mailSender")
    public MailSender mailSender() {
        MailSender mailSender = new MailSender();
        mailSender.setRegionId(regionId);
        mailSender.setAccessKey(accessKey);
        mailSender.setSecret(secret);
        mailSender.setMailAccount(mailAccount);
        mailSender.setSmsTemplateCode(smsTemplateCode);
        mailSender.setSmsSignName(smsSignName);
        mailSender.initClient();
        return mailSender;
    }


    /**
     * 创建短信发送实现类
     * @return
     */
    @Bean(name ="smsSender")
    public SmsSender smsSender() {
        SmsSender smsSender = new SmsSender();
        smsSender.setRegionId(regionId);
        smsSender.setAccessKey(accessKey);
        smsSender.setSecret(secret);
        smsSender.setMailAccount(mailAccount);
        smsSender.setSmsTemplateCode(smsTemplateCode);
        smsSender.setSmsSignName(smsSignName);
        smsSender.initClient();
        return smsSender;
    }


}
