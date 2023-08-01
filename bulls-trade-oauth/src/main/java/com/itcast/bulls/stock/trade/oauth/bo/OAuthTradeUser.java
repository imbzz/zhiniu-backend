package com.itcast.bulls.stock.trade.oauth.bo;

import com.itcast.bulls.stock.entity.user.TradeUser;
import lombok.Data;
import org.springframework.security.core.userdetails.User;

import java.util.Collections;

/**
 * <p>Description: </p>
 * @date 2020/1/2
 * @author 贺锟 
 * @version 1.0
 * <p>Copyright:Copyright(c)2019</p>
 */
public class OAuthTradeUser extends User {

    private static final long serialVersionUUID = -1L;

    /**
     * 业务用户信息
     */
    private TradeUser tradeUser;

    public OAuthTradeUser(TradeUser tradeUser) {
        // OAUTH2认证用户信息构造处理
        super(tradeUser.getUserNo(), tradeUser.getUserPwd(), (tradeUser.getStatus() == 0 ? true : false),
                true, true, (tradeUser.getStatus() == 0 ? true : false), Collections.emptyList());
        this.tradeUser = tradeUser;
    }

    public TradeUser getTradeUser() {
        return tradeUser;
    }
}
