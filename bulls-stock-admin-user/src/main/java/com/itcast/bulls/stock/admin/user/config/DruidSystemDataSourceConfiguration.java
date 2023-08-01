package com.itcast.bulls.stock.admin.user.config;

import javax.sql.DataSource;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

import com.alibaba.druid.pool.DruidDataSource;

/**
 * <p>Description: 多数据源配置 </p>
 * @date 2019/8/6
 * @author 贺锟 
 * @version 1.0
 * @name mirson
 * <p>Copyright:Copyright(c)2019</p>
 */
@Configuration
public class DruidSystemDataSourceConfiguration {

    /**
     * 业务数据源
     * @return
     */
    @Bean(name = "bizSystemDataSource")
    @ConfigurationProperties(prefix = "spring.datasource.bizsystem")
    @Primary
    public DataSource bizSystemDataSource(){
        return new DruidDataSource();
    }

    /**
     * 交易数据源
     * @return
     */
    @Bean(name = "tradeSystemDataSource")
    @ConfigurationProperties(prefix = "spring.datasource.tradesystem")
    public DataSource tradeSystemDataSource(){
        return new DruidDataSource();
    }
}
