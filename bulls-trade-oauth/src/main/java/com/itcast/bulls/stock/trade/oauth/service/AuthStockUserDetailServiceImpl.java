package com.itcast.bulls.stock.trade.oauth.service;

import com.itcast.bulls.stock.common.utils.GlobalConstants;
import com.itcast.bulls.stock.entity.user.TradeUser;
import com.itcast.bulls.stock.trade.oauth.bo.OAuthTradeUser;
import com.itcast.bulls.stock.trade.oauth.repository.TradeUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

/**
 * <p>Description: </p>
 * @date 2020/1/2
 * @author 贺锟 
 * @version 1.0
 * <p>Copyright:Copyright(c)2019</p>
 */
@Service("authStockUserDetailService")
public class AuthStockUserDetailServiceImpl implements UserDetailsService {

    @Autowired
    private TradeUserRepository tradeUserRepository;

    @Autowired
    private CacheManager cacheManager;

    @Override
    public UserDetails loadUserByUsername(String userNo) throws UsernameNotFoundException {
        // 1. 查询缓存
        Cache cache = cacheManager.getCache(GlobalConstants.OAUTH_KEY_STOCK_USER_DETAILS);
        if(null != cache && null != cache.get(userNo)) {
            return (UserDetails)cache.get(userNo).get();
        }

        // 2. 缓存未找到, 查询数据库
        TradeUser tradeUser = tradeUserRepository.findByUserNo(userNo);
        if(null == tradeUser) {
            throw new UsernameNotFoundException(userNo + " not valid!");
        }

        // 3. 对用户信息做封装处理
        UserDetails userDetails = new OAuthTradeUser(tradeUser);

        // 4. 将封装的信息放入到缓存内
        cache.put(userNo, userDetails);

        return userDetails;

    }
}
