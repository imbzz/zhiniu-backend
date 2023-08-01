package com.itcast.trade.bulls.stock.gateway.startup;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.annotation.ComponentScan;

/**
 * <p>Description: </p>
 * @date 2019/12/12
 * @author 贺锟 
 * @version 1.0
 * @name  Mirson
 * <p>Copyright:Copyright(c)2019</p>
 */
@SpringBootApplication
@EnableDiscoveryClient
@ComponentScan(basePackages = {"com.itcast"})
public class BullsStockGatewayApplication {

    public static void main(String[] args) {
        SpringApplication.run(BullsStockGatewayApplication.class, args);
    }
}
