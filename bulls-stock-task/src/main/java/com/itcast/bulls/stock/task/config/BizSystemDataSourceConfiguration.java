package com.itcast.bulls.stock.task.config;

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
@MapperScan(basePackages = "com.itcast.bulls.stock.task.dao.biz", sqlSessionTemplateRef  = "bizSystemSqlSessionTemplate")
public class BizSystemDataSourceConfiguration {

    @Autowired
    private HibernateProperties hibernateProperties;

    @Autowired
    private JpaProperties jpaProperties;

    @Autowired
    @Qualifier("bizSystemDataSource")
    private DataSource bizTransactionManager;
    

    @Bean(name = "bizSystemSqlSessionFactory")
    public SqlSessionFactory bizSystemSqlSessionFactory(@Qualifier("bizSystemDataSource") DataSource dataSource) throws Exception {
        SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
        bean.setDataSource(dataSource);
        bean.setMapperLocations(new PathMatchingResourcePatternResolver().getResources("classpath:com/itcast/bulls/stock/task/dao/biz/mapper/*Mapper.xml"));
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
