package com.itcast.bulls.stock.trade.oauth.config;

import com.itcast.bulls.stock.common.utils.GlobalConstants;
import com.itcast.bulls.stock.entity.user.TradeUser;
import com.itcast.bulls.stock.trade.oauth.bo.OAuthTradeUser;
import com.itcast.bulls.stock.trade.oauth.service.AuthClientDetailService;
import lombok.SneakyThrows;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.JdkSerializationRedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.oauth2.common.DefaultOAuth2AccessToken;
import org.springframework.security.oauth2.config.annotation.configurers.ClientDetailsServiceConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configuration.AuthorizationServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableAuthorizationServer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerEndpointsConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.token.DefaultAuthenticationKeyGenerator;
import org.springframework.security.oauth2.provider.token.TokenEnhancer;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.security.oauth2.provider.token.store.redis.RedisTokenStore;

import javax.sql.DataSource;
import java.util.HashMap;
import java.util.Map;

/**
 * <p>Description: </p>
 * @date 2020/1/2
 * @author 贺锟 
 * @version 1.0
 * <p>Copyright:Copyright(c)2019</p>
 */
@Configuration
@EnableAuthorizationServer
@Log4j2
public class AuthorizationServerConfig extends AuthorizationServerConfigurerAdapter {

    /**
     * 数据源配置
     */
    @Autowired
    private DataSource dataSource;

    /**
     * 用户认证信息鉴权实现类
     */
    @Autowired
    private UserDetailsService authStockUserDetailService;

    /**
     * 认证服务管理器
     */
    @Autowired
    private AuthenticationManager authenticationManager;

    /**
     * Redis缓存服务
     */
    @Autowired
    private RedisConnectionFactory redisConnectionFactory;

    /**
     * t_oauth_client_details 表的字段，不包括client_id、client_secret
     */
    String CLIENT_FIELDS = "client_id, client_secret, resource_ids, scope, "
            + "authorized_grant_types, web_server_redirect_uri, authorities, access_token_validity, "
            + "refresh_token_validity, additional_information, autoapprove";

    /**
     * JdbcClientDetailsService 查询语句
     */
    String BASE_FIND_STATEMENT = "select " + CLIENT_FIELDS
            + " from t_oauth_client_details";

    /**
     * 默认的查询语句
     */
    String DEFAULT_FIND_STATEMENT = BASE_FIND_STATEMENT + " order by client_id";

    /**
     * 按条件client_id 查询
     */
    String DEFAULT_SELECT_STATEMENT = BASE_FIND_STATEMENT + " where client_id = ?";


    /**
     *  Redis 缓存配置
     * @return
     */
    @Bean
    public RedisTemplate<String, Object> stockRedisTemplate() {
        RedisTemplate<String, Object> redisTemplate = new RedisTemplate<>();
        //  key编码类型, 采用string
        redisTemplate.setKeySerializer(new StringRedisSerializer());
        // hashkey的编码类型, 采用string
        redisTemplate.setHashKeySerializer(new StringRedisSerializer());
        // value值的编码类型, 采用JDK序列化实现
        redisTemplate.setValueSerializer(new JdkSerializationRedisSerializer());
        // hashvalue值的编码类型, 采用JDK序列化实现
        redisTemplate.setHashValueSerializer(new JdkSerializationRedisSerializer());
        // 设置Redis的连接工厂
        redisTemplate.setConnectionFactory(redisConnectionFactory);
        return redisTemplate;
    }


    /**
     * 自定义Client查询，可以修改表名， 字段等
     * @param clients
     */
    @Override
    @SneakyThrows
    public void configure(ClientDetailsServiceConfigurer clients) {
        AuthClientDetailService clientDetailsService = new AuthClientDetailService(dataSource);
        clientDetailsService.setSelectClientDetailsSql(DEFAULT_SELECT_STATEMENT);
        clientDetailsService.setFindClientDetailsSql(DEFAULT_FIND_STATEMENT);
        clients.withClientDetails(clientDetailsService);
    }

    /**
     * 防止申请token时出现401错误
     * @param oauthServer
     */
    @Override
    public void configure(AuthorizationServerSecurityConfigurer oauthServer) {
        oauthServer
                .tokenKeyAccess("permitAll()")
                .checkTokenAccess("permitAll()")
                .allowFormAuthenticationForClients();
    }


    /**
     * 认证服务配置
     * @param endpoints
     */
    @Override
    public void configure(AuthorizationServerEndpointsConfigurer endpoints) {
        endpoints
                .allowedTokenEndpointRequestMethods(HttpMethod.GET, HttpMethod.POST)
                .tokenStore(tokenStore())
                .tokenEnhancer(tokenEnhancer())
                .userDetailsService(authStockUserDetailService)
                .authenticationManager(authenticationManager)
                .reuseRefreshTokens(false);
    }


    /**
     * TokenStore存储实现方式， 采用Redis缓存
     * @return
     */
    @Bean
    public TokenStore tokenStore() {
        RedisTokenStore tokenStore = new RedisTokenStore(redisConnectionFactory);
        tokenStore.setPrefix(GlobalConstants.OAUTH_PREFIX_KEY);
        tokenStore.setAuthenticationKeyGenerator(new DefaultAuthenticationKeyGenerator() {
            @Override
            public String extractKey(OAuth2Authentication authentication) {
                return super.extractKey(authentication);
            }
        });
        return tokenStore;
    }


    /**
     * token增强处理， 支持扩展信息
     * @return TokenEnhancer
     */
    @Bean
    public TokenEnhancer tokenEnhancer() {
        return (accessToken, authentication) -> {
            try {
                if (GlobalConstants.OAUTH_CLIENT_CREDENTIALS
                        .equals(authentication.getOAuth2Request().getGrantType())) {
                    return accessToken;
                }
                // 通过MAP存储附加的信息
                final Map<String, Object> additionalInfo = new HashMap<>(16);
                OAuthTradeUser authTradeUser = (OAuthTradeUser) authentication.getUserAuthentication().getPrincipal();
                if (null != authTradeUser) {
                    TradeUser tradeUser = authTradeUser.getTradeUser();
                    // 增加附件的信息
                    additionalInfo.put(GlobalConstants.OAUTH_DETAILS_USER_ID, tradeUser.getId());
                    additionalInfo.put(GlobalConstants.OAUTH_DETAILS_USERNAME, tradeUser.getName());
                    additionalInfo.put(GlobalConstants.OAUTH_DETAILS_LOGIN_INFO, tradeUser.getEmail() + "|" + tradeUser.getAddress());
                    additionalInfo.put("active", true);
                }
                // 将附加的信息记录保存, 形成增强的TOKEN
                ((DefaultOAuth2AccessToken) accessToken).setAdditionalInformation(additionalInfo);
            } catch (Exception e) {
                log.error(e.getMessage(), e);
            }
            return accessToken;
        };
    }

}
