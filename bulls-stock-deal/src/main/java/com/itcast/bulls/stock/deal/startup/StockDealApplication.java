package com.itcast.bulls.stock.deal.startup;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.annotation.ComponentScan;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@SpringBootApplication
@EnableDiscoveryClient
@ComponentScan(basePackages = {"com.itcast"})
@MapperScan(basePackages = {"com.itcast.bulls.stock.deal.dao"})
public class StockDealApplication {

    public static void main(String[] args) {
        SpringApplication.run(StockDealApplication.class, args);
    }
}
