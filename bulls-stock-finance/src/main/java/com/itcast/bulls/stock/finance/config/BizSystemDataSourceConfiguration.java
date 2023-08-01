package com.itcast.bulls.stock.finance.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.orm.jpa.HibernateProperties;
import org.springframework.boot.autoconfigure.orm.jpa.JpaProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;


@Configuration
@MapperScan(basePackages = "com.itcast.bulls.stock.finance.dao.biz", sqlSessionTemplateRef  = "bizSystemSqlSessionTemplate")
public class BizSystemDataSourceConfiguration {

    @Autowired
    private HibernateProperties hibernateProperties;

    @Autowired
    private JpaProperties jpaProperties;

    @Bean(name = "bizSystemSqlSessionFactory")
    public SqlSessionFactory bizSystemSqlSessionFactory(@Qualifier("bizProxyDataSource") DataSource dataSource) throws Exception {
        SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
        bean.setDataSource(dataSource);
        bean.setMapperLocations(new PathMatchingResourcePatternResolver().getResources("classpath:com/itcast/bulls/stock/finance/dao/biz/mapper/*Mapper.xml"));
        return bean.getObject();
    }

    @Bean(name = "bizSystemTransactionManager")
    public DataSourceTransactionManager bizSystemTransactionManager(@Qualifier("bizProxyDataSource") DataSource dataSource) {
        return new DataSourceTransactionManager(dataSource);
    }

    @Bean(name = "bizSystemSqlSessionTemplate")
    public SqlSessionTemplate bizSystemSqlSessionTemplate(@Qualifier("bizSystemSqlSessionFactory") SqlSessionFactory sqlSessionFactory) throws Exception {
        return new SqlSessionTemplate(sqlSessionFactory);
    }

}
