package com.itcast.trade.bulls.stock.user.startup;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@SpringBootApplication
@EnableDiscoveryClient
@EnableFeignClients
@ComponentScan(basePackages = {"com.itcast"})
@MapperScan({"com.itcast.trade.bulls.stock.user.dao", "com.itcast.bulls.stock.common.system.dao"})
@EnableTransactionManagement
public class StockUserApplication {

    public static void main(String[] args) {

        SpringApplication.run(StockUserApplication.class, args);
    }

}
