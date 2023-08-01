package com.itcast.bulls.stock.admin.user.config;

import java.util.stream.Collectors;

import javax.persistence.EntityManagerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.rest.core.config.RepositoryRestConfiguration;
import org.springframework.data.rest.webmvc.config.RepositoryRestConfigurerAdapter;

/**
 * <p>Description: </p>
 * @date 2020/1/10
 * @author 贺锟 
 * @version 1.0
 * <p>Copyright:Copyright(c)2019</p>
 */
@Configuration
public class RestEntityIdConfiguration extends RepositoryRestConfigurerAdapter {

    @Autowired
    @Qualifier("bizEntityManagerFactory")
    private EntityManagerFactory bizEntityManagerFactory;


    @Autowired
    @Qualifier("tradeEntityManagerFactory")
    private EntityManagerFactory tradeEntityManagerFactory;

    @Override
    public void configureRepositoryRestConfiguration(RepositoryRestConfiguration config) {
        // 扫描所有rest资源对象， 返回数据ID(业务数据库)
        config.exposeIdsFor(bizEntityManagerFactory.getMetamodel().getEntities().stream().map(e -> e.getJavaType()).collect(Collectors.toList()).toArray(new Class[0]));
        // 扫描所有rest资源对象， 返回数据ID（交易数据库）
        config.exposeIdsFor(tradeEntityManagerFactory.getMetamodel().getEntities().stream().map(e -> e.getJavaType()).collect(Collectors.toList()).toArray(new Class[0]));
    }

}
