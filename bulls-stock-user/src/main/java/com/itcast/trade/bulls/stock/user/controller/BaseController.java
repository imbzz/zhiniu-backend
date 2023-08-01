package com.itcast.trade.bulls.stock.user.controller;

import com.itcast.bulls.stock.common.exception.ComponentException;
import com.itcast.bulls.stock.common.exception.constants.ApplicationErrorCodeEnum;
import com.itcast.bulls.stock.common.utils.GlobalConstants;
import javafx.application.Application;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
public class BaseController {

    /**
     * token的存取管理接口
     */
    @Autowired
    private TokenStore tokenStore;

    protected String getCurrentToken(){
        // 1. 获取Request对象
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        // 2. 获取Token信息
        String token = request.getHeader("Authorization");
        if(null != token) {
            token = token.replace(OAuth2AccessToken.BEARER_TYPE, "").trim();
        }
        return token ;
    }

    protected Long getUserId() throws ComponentException {
        // 1. 获Access Token信息
        OAuth2AccessToken auth2AccessToken = tokenStore.readAccessToken(getCurrentToken());
        if(null == auth2AccessToken) {
            throw new ComponentException(ApplicationErrorCodeEnum.SYS_NOT_VALID_TOKEN);
        }

        // 2. 获取Token 的增强信息
        Map<String, Object> addtionalInfos = auth2AccessToken.getAdditionalInformation();
        if(null == addtionalInfos) {
            throw new ComponentException(ApplicationErrorCodeEnum.SYS_NOT_ACCESS_USER);
        }
        // 3. 获取用户的ID信息
        Long userId = (Long) addtionalInfos.get(GlobalConstants.OAUTH_DETAILS_USER_ID);
        if(null == userId) {
            throw new ComponentException(ApplicationErrorCodeEnum.SYS_NOT_ACCESS_USER);
        }

        return userId;
    }

}
