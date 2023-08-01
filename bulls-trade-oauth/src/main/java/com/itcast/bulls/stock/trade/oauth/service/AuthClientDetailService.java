package com.itcast.bulls.stock.trade.oauth.service;

import com.itcast.bulls.stock.common.utils.GlobalConstants;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.security.oauth2.common.exceptions.InvalidClientException;
import org.springframework.security.oauth2.provider.ClientDetails;
import org.springframework.security.oauth2.provider.client.JdbcClientDetailsService;

import javax.sql.DataSource;

/**
 * <p>Description: </p>
 * @date 2020/1/2
 * @author 贺锟 
 * @version 1.0
 * <p>Copyright:Copyright(c)2019</p>
 */
public class AuthClientDetailService extends JdbcClientDetailsService {

    public AuthClientDetailService(DataSource dataSource) {
        super(dataSource);
    }

    /***
     * 重写父类方法, 对客户端信息的获取, 加入缓存处理
     * @param clientId
     * @return
     * @throws InvalidClientException
     */
    @Override
    @Cacheable(value = GlobalConstants.OAUTH_KEY_CLIENT_DETAILS, key= "#clientId", unless = "#result == null ")
    public ClientDetails loadClientByClientId(String clientId) throws InvalidClientException {
        return super.loadClientByClientId(clientId);
    }
}
