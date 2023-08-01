package com.itcast.bulls.stock.pending.config;

import io.seata.spring.annotation.GlobalTransactionScanner;
import org.springframework.beans.factory.annotation.Value;
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
public class SeataConfiguration {

    /**
     * 获取服务的名称
     */
    @Value("${spring.application.name}")
    private String applicationId;

    @Bean
    public GlobalTransactionScanner globalTransactionScanner() {
        GlobalTransactionScanner globalTransactionScanner = new GlobalTransactionScanner(applicationId,
                "stock_trade_group");
        return globalTransactionScanner;
    }
}
