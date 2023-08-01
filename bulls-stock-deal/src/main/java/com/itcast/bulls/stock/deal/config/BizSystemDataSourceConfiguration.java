package com.itcast.bulls.stock.deal.config;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import javax.sql.DataSource;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@Configuration
@MapperScan(basePackages = "com.itcast.bulls.stock.deal.dao.biz", sqlSessionTemplateRef  = "bizSystemSqlSessionTemplate")
public class BizSystemDataSourceConfiguration {



    @Bean(name = "bizSystemSqlSessionFactory")
    public SqlSessionFactory bizSystemSqlSessionFactory(@Qualifier("bizSystemDataSource") DataSource dataSource) throws Exception {
        SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
        bean.setDataSource(dataSource);
        bean.setMapperLocations(new PathMatchingResourcePatternResolver().getResources("classpath:com/itcast/bulls/stock/deal/dao/biz/mapper/*Mapper.xml"));
        return bean.getObject();
    }

    @Bean(name = "bizSystemTransactionManager")
    public DataSourceTransactionManager bizSystemTransactionManager(@Qualifier("bizSystemDataSource") DataSource dataSource) {
        return new DataSourceTransactionManager(dataSource);
    }

    @Bean(name = "bizSystemSqlSessionTemplate")
    public SqlSessionTemplate bizSystemSqlSessionTemplate(@Qualifier("bizSystemSqlSessionFactory") SqlSessionFactory sqlSessionFactory) throws Exception {
        return new SqlSessionTemplate(sqlSessionFactory);
    }

}
