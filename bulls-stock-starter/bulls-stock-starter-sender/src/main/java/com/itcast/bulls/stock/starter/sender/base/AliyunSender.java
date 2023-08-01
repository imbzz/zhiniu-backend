package com.itcast.bulls.stock.starter.sender.base;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;
import lombok.Data;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@Data
public abstract class AliyunSender {

    /**
     * 区域信息
     */
    private String regionId;

    /**
     * 访问key
     */
    private String accessKey;

    /**
     * 授权密钥
     */
    private String secret;

    /**
     * 邮箱帐号
     */
    private String mailAccount;

    /**
     * 短信模板编号, 需在阿里云上预先配置
     */
    private String smsTemplateCode;

    /**
     * 短信签名
     */
    private String smsSignName;


    // 如果是除杭州region外的其它region（如新加坡、澳洲Region），需要将下面的"cn-hangzhou"替换为"ap-southeast-1"、或"ap-southeast-2"。
    protected IClientProfile profile;

    protected IAcsClient client;

    public void initClient() {
        this.profile = DefaultProfile.getProfile(getRegionId(), getAccessKey(), getSecret());
        this.client = new DefaultAcsClient(profile);
    }


}