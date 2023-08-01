package com.itcast.bulls.stock.quote.config;

import com.itcast.bulls.stock.common.generator.GlobalIDGenerator;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.CachingConfigurerSupport;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.StringRedisSerializer;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@Configuration
@EnableCaching
public class RedisConfiguration extends CachingConfigurerSupport {

    @Value("${snowflake.workerId}")
    private Long workerId;
    @Value("${snowflake.datacenterId}")
    private Long datacenterId;

    /**
     * 全局ID生成器
     * @return
     */
    @Bean
    public GlobalIDGenerator globalIDGenerator() {
        if(null == workerId || null == datacenterId) {
            return new GlobalIDGenerator();
        }
        return new GlobalIDGenerator(workerId, datacenterId);
    }


    /**
     * 采用字符串序列化KEY
     * @param factory
     * @return
     */
    @Bean
    public RedisTemplate<String, Object> redisTemplate(RedisConnectionFactory factory) {
        RedisTemplate<String, Object> redisTemplate = new RedisTemplate<String, Object>();
        redisTemplate.setKeySerializer(new StringRedisSerializer());
        redisTemplate.setConnectionFactory(factory);
        return redisTemplate;
    }

}
