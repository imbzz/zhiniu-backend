package com.itcast.trade.bulls.stock.user.config;

import com.itcast.bulls.stock.common.generator.GlobalIDGenerator;
import com.itcast.bulls.stock.common.utils.GlobalConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.token.DefaultAuthenticationKeyGenerator;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.security.oauth2.provider.token.store.redis.RedisTokenStore;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@Configuration
public class GlobalSystemConfiguration {

    /**
     *  snowflake的工作中心ID
     */
    @Value("${snowflake.workerId}")
    private Long workerId;

    /**
     * snowflake的数据中心ID
     */
    @Value("${snowflake.datacenterId}")
    private Long datacenterId;

    @Autowired
    private RedisConnectionFactory redisConnectionFactory;

    /**
     * 定义全局ID生成器
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
     * TokenStore的配置
     * @return
     */
    @Bean
    public TokenStore tokenStore() {
        RedisTokenStore tokenStore = new RedisTokenStore(redisConnectionFactory);
        tokenStore.setPrefix(GlobalConstants.OAUTH_PREFIX_KEY);
        return tokenStore;
    }

}
