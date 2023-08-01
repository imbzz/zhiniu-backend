package com.itcast.bulls.stock.position.config;

import javax.sql.DataSource;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

import com.alibaba.druid.pool.DruidDataSource;


@Configuration
public class DruidSystemDataSourceConfiguration {

    /**
     * 业务数据源
     * @return
     */
    @Bean(name = "bizSystemDataSource")
    @ConfigurationProperties(prefix = "spring.datasource.bizsystem")
    public DataSource bizSystemDataSource(){
        return new DruidDataSource();
    }

    /**
     * 交易数据源
     * @return
     */
    @Bean(name = "tradeSystemDataSource")
    @Primary
    @ConfigurationProperties(prefix = "spring.datasource.tradesystem")
    public DataSource tradeSystemDataSource(){
        return new DruidDataSource();
    }
}
