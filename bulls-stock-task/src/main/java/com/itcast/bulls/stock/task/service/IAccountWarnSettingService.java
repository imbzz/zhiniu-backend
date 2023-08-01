package com.itcast.bulls.stock.task.service;

import org.springframework.transaction.annotation.Transactional;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
public interface IAccountWarnSettingService {

    /**
     * 生成预警通知记录的接口实现
     */
    @Transactional(rollbackFor = Exception.class)
    void generateWarnNotifyMessage();

    /**
     * 发送预警通知数据
     */
    void sendWarnNotifyMessage();
}
