package com.itcast.bulls.stock.trade.oauth.startup;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

/**
 * <p>Description: </p>
 * @date 2020/1/2
 * @author 贺锟 
 * @version 1.0
 * <p>Copyright:Copyright(c)2019</p>
 */
@SpringBootApplication
@EnableDiscoveryClient
@ComponentScan(basePackages = {"com.itcast"})
@EntityScan(basePackages = {"com.itcast"})
@EnableJpaRepositories(basePackages = {"com.itcast"})
@EnableCaching
public class TradeAuthApplication {

    public static void main(String[] args) {
        SpringApplication.run(TradeAuthApplication.class, args);
    }
}
