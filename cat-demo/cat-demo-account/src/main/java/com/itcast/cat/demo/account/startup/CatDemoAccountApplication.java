package com.itcast.cat.demo.account.startup;

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
@RestController
@EnableDiscoveryClient
@ComponentScan(basePackages = {"com.itcast"})
public class CatDemoAccountApplication {

    public static void main(String[] args) {
        SpringApplication.run(CatDemoAccountApplication.class, args);
    }

    /**
     * 对外提供的账户服务接口
     * @return
     * @throws Exception
     */
    @RequestMapping("/account")
    public String account() throws Exception {
        Thread.sleep(200);
        return "account success";
    }
}
