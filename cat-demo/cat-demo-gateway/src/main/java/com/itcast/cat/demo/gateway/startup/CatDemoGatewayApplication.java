package com.itcast.cat.demo.gateway.startup;

import com.dianping.cat.Cat;
import com.dianping.cat.CatConstants;
import com.dianping.cat.message.Transaction;
import com.itcast.cat.demo.gateway.catutils.CatRestInterceptor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import java.util.Collections;

/**
 * <p>Description: </p>
 * @date 2019/12/19
 * @author 贺锟 
 * @version 1.0
 * <p>Copyright:Copyright(c)2019</p>
 */
@SpringBootApplication
@EnableDiscoveryClient
@Log4j2
@ComponentScan(basePackages = {"com.itcast"})
@RestController
public class CatDemoGatewayApplication {

    @Autowired
    private RestTemplate restTemplate;

    @Value("${service.address:localhost:8082}")
    private String serviceAddress;



    public static void main(String[] args) {

        SpringApplication.run(CatDemoGatewayApplication.class, args);
    }

    @RequestMapping("/gateway")
    public String gateway() throws Exception {
        // 调用订单服务
        // 1. 模拟休眠100毫秒
        Thread.sleep(100);
        // 2. 调用订单服务
        String response = restTemplate.getForObject("http://" + serviceAddress + "/order", String.class);
        // 3. 返回处理结果
        return "gateway service ==> " + response;
    }

    @RequestMapping("/timeout")
    public String timeout() throws Exception  {
        Transaction t = Cat.newTransaction(CatConstants.TYPE_URL, "timeout");
        try {
            // 1. 休眠100毫秒
            Thread.sleep(100);
            // 2. 远程调用， 调用业务接口， 内部模拟超时处理
            String response = restTemplate.getForObject("http://" + serviceAddress + "/readtimeout", String.class);
            return response;
        }catch(Exception e) {
            e.printStackTrace();
            log.error(e.getMessage(), e);
            t.setStatus(e);
            throw e;
        }finally {
            t.complete();
        }
    }

    @Bean
    RestTemplate restTemplate() {

        RestTemplate restTemplate = new RestTemplate();

        // 保存和传递调用链上下文
        restTemplate.setInterceptors(Collections.singletonList(new CatRestInterceptor()));

        return restTemplate;
    }



}
