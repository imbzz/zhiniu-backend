package com.itcast.bulls.stock.deal.service.user;

import com.itcast.bulls.stock.common.exception.ComponentException;
import com.itcast.bulls.stock.struct.grpc.trade.AccountWarnSettingRequest;
import org.springframework.scheduling.annotation.Scheduled;

import javax.annotation.PostConstruct;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
public interface ITradeUserService {

    /**
     * 保存用户设置的预警信息
     * @param request
     */
    void saveAccountWarnSetting(AccountWarnSettingRequest request) throws ComponentException;

    /**
     * 每天凌晨3点， 加载账户预警设置至缓存
     */
    @PostConstruct
    @Scheduled(cron = "0 0 3 * * ?")
    void scheduledAccountWarnSettingCache();
}
