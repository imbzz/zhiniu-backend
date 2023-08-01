package com.itcast.cat.demo.order.startup;

import com.dianping.cat.Cat;
import com.dianping.cat.CatConstants;
import com.dianping.cat.message.Transaction;
import com.itcast.cat.demo.order.catutils.CatRestInterceptor;
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
@RestController
@EnableDiscoveryClient
@ComponentScan(basePackages = {"com.itcast"})
@Log4j2
public class CatDemoOrderApplication {

    @Autowired
    private RestTemplate restTemplate;

    @Value("${service.account.address:localhost:8083}")
    private String accountService;

    @Value("${service.stock.address:localhost:8084}")
    private String stockService;

    @Value("${server.port}")
    private String serverPort;

    public static void main(String[] args) {
        SpringApplication.run(CatDemoOrderApplication.class, args);
    }


    /**
     * 模拟订单请求的处理
     * @return
     * @throws Exception
     */
    @RequestMapping("/order")
    private String order() throws Exception {
        // 1.模拟逻辑处理， 休眠200毫秒
        Thread.sleep(200);
        // 2. 调用Account服务
        String accountResp = restTemplate.getForObject("http://" + accountService + "/account", String.class);
        // 3. 调用库存服务
        String stockResp = restTemplate.getForObject("http://" + stockService + "/stock", String.class);

        return String.format("Calling Order Service[order success] ==> Calling Account Service[%s] ==> Calling Stock Service [%s] ", accountService, stockService);
    }

    /**
     * 模拟超时异常请求
     * @return
     * @throws Exception
     */
    @RequestMapping("/readtimeout")
    private String readtimeout() throws Exception {
        Transaction transaction = Cat.newTransaction(CatConstants.TYPE_CALL, "connectionTimeout");
        Thread.sleep(500);
        try {
            log.info("Calling a timeout service. ");
            restTemplate.getForObject("http://localhost:" + serverPort + "/notExist", String.class);
            return "the service is block.";
        }catch (Exception e) {
            // 记录上报异常信息
            transaction.setStatus(e);
            throw e;
        }finally {
            transaction.complete();
        }
    }


    @Bean
    RestTemplate restTemplate() {
        RestTemplate restTemplate = new RestTemplate();
        //保存和传递CAT的上下文依赖
        restTemplate.setInterceptors(Collections.singletonList(new CatRestInterceptor()));

        return restTemplate;
    }
}
