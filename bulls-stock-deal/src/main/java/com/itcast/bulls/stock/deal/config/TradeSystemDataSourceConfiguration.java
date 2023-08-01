package com.itcast.bulls.stock.deal.config;

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
import org.springframework.context.annotation.Primary;
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
@MapperScan(basePackages = "com.itcast.bulls.stock.deal.dao.trade", sqlSessionTemplateRef  = "tradeSystemSqlSessionTemplate")
public class TradeSystemDataSourceConfiguration {

    @Bean(name = "tradeSystemSqlSessionFactory")
    @Primary
    public SqlSessionFactory tradeSystemSqlSessionFactory(@Qualifier("tradeSystemDataSource") DataSource dataSource) throws Exception {
        SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
        bean.setDataSource(dataSource);
        bean.setMapperLocations(new PathMatchingResourcePatternResolver().getResources("classpath:com/itcast/bulls/stock/deal/dao/trade/mapper/*Mapper.xml"));
        return bean.getObject();
    }

    @Bean(name = "tradeSystemTransactionManager")
    @Primary
    public DataSourceTransactionManager tradeSystemTransactionManager(@Qualifier("tradeSystemDataSource") DataSource dataSource) {
        return new DataSourceTransactionManager(dataSource);
    }

    @Bean(name = "tradeSystemSqlSessionTemplate")
    @Primary
    public SqlSessionTemplate tradeSystemSqlSessionTemplate(@Qualifier("tradeSystemSqlSessionFactory") SqlSessionFactory sqlSessionFactory) throws Exception {
        return new SqlSessionTemplate(sqlSessionFactory);
    }

}