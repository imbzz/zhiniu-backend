package com.itcast.cat.demo.stock.startup;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>Description: </p>
 * @date 2019/12/19
 * @author 贺锟 
 * @version 1.0
 * <p>Copyright:Copyright(c)2019</p>
 */
@SpringBootApplication
@EnableDiscoveryClient
@ComponentScan(basePackages = {"com.itcast"})
@RestController
public class CatDemoStockApplication {

    public static void main(String[] args) {

        SpringApplication.run(CatDemoStockApplication.class, args);
    }

    /**
     * 模拟提供库存服务的接口
     * @return
     * @throws Exception
     */
    @RequestMapping("/stock")
    public String stock() throws Exception{
        Thread.sleep(200);
        return "stock sucess.";
    }
}
