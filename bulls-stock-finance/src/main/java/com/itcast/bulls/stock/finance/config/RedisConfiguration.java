package com.itcast.bulls.stock.finance.config;

import java.time.Duration;

import com.itcast.bull.stock.common.service.lock.RedisLockService;
import com.itcast.bulls.stock.common.utils.GlobalConstants;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.CachingConfigurerSupport;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.cache.RedisCacheConfiguration;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.integration.redis.util.RedisLockRegistry;


@Configuration
@EnableCaching
public class RedisConfiguration extends CachingConfigurerSupport {


    @Bean(value ="redisTemplate")
    public RedisTemplate<String, Object> redisTemplate(RedisConnectionFactory redisConnectionFactory) {
        RedisTemplate<String, Object> redisTemplate = new RedisTemplate<String, Object>();
        redisTemplate.setKeySerializer(new StringRedisSerializer());
        redisTemplate.setConnectionFactory(redisConnectionFactory);
        return redisTemplate;
    }

    /**
     * 设置默认超时时间
     * @param redisConnectionFactory
     * @return
     */
    @Bean
    public CacheManager cacheManager(RedisConnectionFactory redisConnectionFactory) {
        Duration expiration = Duration.ofSeconds(3600 * 24);
        return RedisCacheManager.builder(redisConnectionFactory)
                .cacheDefaults(RedisCacheConfiguration.defaultCacheConfig().entryTtl(expiration)).build();
    }

    /**
     * 分布式锁的配置
     * @param redisConnectionFactory
     * @return
     */
    @Bean
    public RedisLockRegistry redisLockRegistry(RedisConnectionFactory redisConnectionFactory) {
        // 初始化分布式锁的管理器, 并且设置超时时间
        RedisLockRegistry redisLockRegistry = new RedisLockRegistry(redisConnectionFactory, GlobalConstants.DISTRIB_LOCK_FOR_FINANCE, GlobalConstants.DISTRIB_LOCK_KEY_EXPIRE);
        return redisLockRegistry;
    }

    /**
     * 配置分布式锁的实现类
     * @param redisLockRegistry
     * @return
     */
    @Bean
    public RedisLockService redisLockService(RedisLockRegistry redisLockRegistry) {
        RedisLockService redisLockService = new RedisLockService(redisLockRegistry, GlobalConstants.DISTRIB_LOCK_KEY_WAITTIME);
        return redisLockService;
    }

}
