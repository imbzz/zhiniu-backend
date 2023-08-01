package com.itcast.bulls.stock.starter.ceph;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@Configuration
@EnableAutoConfiguration
@ConditionalOnProperty(name = "ceph.authUrl")
public class AutoCephSwiftConfiguration {

    @Value("${ceph.username}")
    private String username;
    @Value("${ceph.password}")
    private String password;
    @Value("${ceph.authUrl}")
    private String authUrl;
    @Value("${ceph.defaultContainerName}")
    private String defaultContainerName;


    @Bean
    public CephSwiftOperator cephSwiftOperator() {
        return new CephSwiftOperator(username, password, authUrl, defaultContainerName);
    }

}