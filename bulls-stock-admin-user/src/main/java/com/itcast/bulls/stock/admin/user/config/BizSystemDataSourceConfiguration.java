package com.itcast.bulls.stock.admin.user.config;

import java.util.Map;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.orm.jpa.HibernateProperties;
import org.springframework.boot.autoconfigure.orm.jpa.HibernateSettings;
import org.springframework.boot.autoconfigure.orm.jpa.JpaProperties;
import org.springframework.boot.orm.jpa.EntityManagerFactoryBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * <p>Description: </p>
 * @date 2019/8/6
 * @author 贺锟 
 * @version 1.0
 * @name mirson
 * <p>Copyright:Copyright(c)2019</p>
 */
@Configuration
@EnableTransactionManagement
@EnableJpaRepositories(
        // repository包名
        basePackages = "com.itcast.bulls.stock.admin.user.repository.biz",
        // 实体管理bean名称
        entityManagerFactoryRef = "bizEntityManagerFactory",
        // 事务管理bean名称
        transactionManagerRef = "bizTransactionManager"
)
public class BizSystemDataSourceConfiguration {

    @Autowired
    private HibernateProperties hibernateProperties;

    @Autowired
    private JpaProperties jpaProperties;

    @Autowired
    @Qualifier("bizSystemDataSource")
    private DataSource bizTransactionManager;

    @Bean(name = "bizEntityManagerFactoryBean")
    public LocalContainerEntityManagerFactoryBean bizEntityManagerFactoryBean(EntityManagerFactoryBuilder builder){
        return builder.dataSource(bizTransactionManager)
                .properties(getVendorProperties(bizTransactionManager))
                //设置实体类所在位置
                .packages("com.itcast.bulls.stock.entity.product", "com.itcast.bulls.stock.entity.user", "com.itcast.bulls.stock.entity.vo")
                .persistenceUnit("bizPersistenceUnit")
                .build();
    }


    private Map<String,Object> getVendorProperties(DataSource dataSource){
        Map<String,Object> props = hibernateProperties.determineHibernateProperties(jpaProperties.getProperties(), new HibernateSettings());
        props.put("hibernate.dialect", "org.hibernate.dialect.MySQL5InnoDBDialect");
        return props;
    }

    /**
     * EntityManagerFactory类似于Hibernate的SessionFactory,mybatis的SqlSessionFactory
     * 总之,在执行操作之前,我们总要获取一个EntityManager,这就类似于Hibernate的Session,
     * mybatis的sqlSession.
     */
    @Bean(name = "bizEntityManagerFactory")
    public EntityManagerFactory bizEntityManagerFactory(EntityManagerFactoryBuilder builder){
        return this.bizEntityManagerFactoryBean(builder).getObject();
    }

    /**
     * 配置事物管理器
     */
    @Bean(name = "bizTransactionManager")
    public PlatformTransactionManager bizTransactionManager(EntityManagerFactoryBuilder builder){
        return new JpaTransactionManager(bizEntityManagerFactory(builder));
    }


}
