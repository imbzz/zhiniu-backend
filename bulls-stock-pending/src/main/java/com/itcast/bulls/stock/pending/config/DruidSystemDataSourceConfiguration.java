package com.itcast.bulls.stock.pending.config;

import javax.sql.DataSource;

import io.seata.rm.datasource.DataSourceProxy;
import org.springframework.beans.factory.annotation.Qualifier;
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


    /**
     * Seata分布式事务, 业务数据源的代理配置
     * @param bizSystemDataSource
     * @return
     */
    @Bean("bizProxyDataSource")
    public DataSourceProxy bizProxyDataSource(@Qualifier("bizSystemDataSource") DataSource bizSystemDataSource) {
        return new DataSourceProxy(bizSystemDataSource);
    }
}
