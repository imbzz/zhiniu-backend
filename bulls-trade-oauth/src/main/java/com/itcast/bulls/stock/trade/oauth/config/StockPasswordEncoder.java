package com.itcast.bulls.stock.trade.oauth.config;

import com.itcast.bulls.stock.common.encrypt.EncryptUtil;
import com.itcast.bulls.stock.common.exception.ComponentException;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

/**
 * <p>Description: </p>
 * @date 2020/1/2
 * @author 贺锟 
 * @version 1.0
 * <p>Copyright:Copyright(c)2019</p>
 */
@Service
@Log4j2
public class StockPasswordEncoder implements PasswordEncoder {

    /**
     * 密码编码处理
     * @param rawPassword
     * @return
     */
    @Override
    public String encode(CharSequence rawPassword) {
        return rawPassword.toString();
    }

    /**
     * 密码校验判断处理
     * @param rawPassword
     * @param encodedPassword
     * @return
     */
    @Override
    public boolean matches(CharSequence rawPassword, String encodedPassword) {
        if(rawPassword != null && rawPassword.length() > 0){
            try {
                // 这里通过MD5及B64加密
                String password = EncryptUtil.encryptSigned(rawPassword.toString());
                boolean isMatch= encodedPassword.equals(password);
                if(!isMatch) {
                    log.warn("password 不一致！");
                }
                return isMatch;
            } catch (ComponentException e) {
                log.error(e.getMessage(), e);
            }
        }
        return false;
    }
}
