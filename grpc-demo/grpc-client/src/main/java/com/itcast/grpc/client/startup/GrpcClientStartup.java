package com.itcast.grpc.client.startup;

import com.itcast.grpc.client.servcie.GrpcClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>Description: </p>
 * @date 2019/12/23
 * @author 贺锟 
 * @version 1.0
 * <p>Copyright:Copyright(c)2019</p>
 */
@SpringBootApplication
@ComponentScan(basePackages = {"com.itcast"})
@RestController
public class GrpcClientStartup {

    @Autowired
    private GrpcClientService grpcClientService;

    public static void main(String[] args) {
        SpringApplication.run(GrpcClientStartup.class, args);
    }

    /**
     * 获取股票价格服务接口
     * @param name
     * @return
     */
    @RequestMapping("/getStockPrice")
    public String getStockPrice(@RequestParam(defaultValue = "中国平安")String name) {
        return grpcClientService.getStockPrice(name);
    }

}
