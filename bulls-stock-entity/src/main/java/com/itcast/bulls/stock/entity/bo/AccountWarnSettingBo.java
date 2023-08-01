package com.itcast.bulls.stock.entity.bo;


import com.itcast.bulls.stock.entity.user.AccountWarnSetting;
import lombok.Data;

/**
 * <p>Description: </p>
 * @date 2019/8/29
 * @author 贺锟 
 * @version 1.0
 * @name  Mirson
 * <p>Copyright:Copyright(c)2019</p>
 */
@Data
public class AccountWarnSettingBo extends AccountWarnSetting {

    /**
     * 用户ID
     */
    private Long userId;

    /**
     * 用户编号
     */
    private String userNo;

    /**
     * 用户名称
     */
    private String userName;

    /**
     * 股票代码
     */
    private String stockCode;

    /**
     * 股票名称
     */
    private String stockName;

    /**
     * 手机
     */
    private String phone;

    /**
     * 邮箱
     */
    private String email;

    /**
     *  上次预警记录时间
     */
    private Long lastWarnRecordTime;

    /**
     * 预警通知次数
     */
    private int notifyTimes;

}
