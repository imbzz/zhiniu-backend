package com.itcast.grpc.server.startup;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

/**
 * <p>Description: </p>
 * @date 2019/12/23
 * @author 贺锟 
 * @version 1.0
 * <p>Copyright:Copyright(c)2019</p>
 */
@SpringBootApplication
@ComponentScan(basePackages = {"com.itcast"})
public class GrpcServerStartup {

    public static void main(String[] args) {
        SpringApplication.run(GrpcServerStartup.class, args);
    }
}
