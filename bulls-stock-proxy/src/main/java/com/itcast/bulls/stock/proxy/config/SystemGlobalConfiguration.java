package com.itcast.bulls.stock.proxy.config;

import com.itcast.bull.stock.common.service.lock.RedisLockService;
import com.itcast.bulls.stock.common.utils.GlobalConstants;
import org.springframework.boot.actuate.autoconfigure.jdbc.DataSourceHealthIndicatorAutoConfiguration;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.autoconfigure.orm.jpa.HibernateJpaAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.integration.redis.util.RedisLockRegistry;

/**
 * <p>Description: </p>
 * @date 2019/9/24
 * @author 贺锟 
 * @version 1.0
 * @name  Mirson
 * <p>Copyright:Copyright(c)2019</p>
 */
@Configuration
@EnableAutoConfiguration(exclude = {DataSourceAutoConfiguration.class,
        DataSourceHealthIndicatorAutoConfiguration.class, HibernateJpaAutoConfiguration.class})
public class SystemGlobalConfiguration {

    /**
     * 分布式锁配置
     * @param redisConnectionFactory
     * @return
     */
    @Bean
    public RedisLockRegistry redisLockRegistry(RedisConnectionFactory redisConnectionFactory) {
        // 初始化分布式锁管理器， 并设置超时时间
        RedisLockRegistry redisLockRegistry = new RedisLockRegistry(redisConnectionFactory,
                GlobalConstants.DISTRIB_LOCK_FOR_PROXY, GlobalConstants.DISTRIB_LOCK_KEY_EXPIRE);
        return redisLockRegistry;
    }

    /**
     * 分布式处理锁封装类
     * @param redisLockRegistry
     * @return
     */
    @Bean
    public RedisLockService redisLockService(RedisLockRegistry redisLockRegistry) {
        RedisLockService redisLockService = new RedisLockService(redisLockRegistry, GlobalConstants.DISTRIB_LOCK_KEY_WAITTIME);
        return redisLockService;
    }
}
