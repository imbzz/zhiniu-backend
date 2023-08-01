package com.itcast.bulls.stock.admin.user.startup;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Import;
import org.springframework.session.data.redis.config.annotation.web.http.EnableRedisHttpSession;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import springfox.documentation.spring.data.rest.configuration.SpringDataRestConfiguration;

/**
 * <p>Description: </p>
 * @date 2020/1/10
 * @author 贺锟 
 * @version 1.0
 * <p>Copyright:Copyright(c)2019</p>
 */
@SpringBootApplication
@ComponentScan(basePackages = {"com.itcast"})
@EnableTransactionManagement
@Import({SpringDataRestConfiguration.class})
@EnableCaching
@EnableRedisHttpSession
@ServletComponentScan(basePackages = {"com.itcast"})
public class StockAdminUserApplication {

    public static void main(String[] args) {
        SpringApplication.run(StockAdminUserApplication.class, args);
    }

}
