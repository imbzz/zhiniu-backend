package com.itcast.trade.bulls.stock.user.service;

import com.itcast.bulls.stock.common.exception.BusinessException;
import com.itcast.bulls.stock.common.exception.ComponentException;
import com.itcast.bulls.stock.entity.user.TradeUser;
import com.itcast.stock.common.web.vo.user.TradeUserVo;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
public interface IStockUserService {


    /**
     * 用户登陆
     * @param userNo
     * @param userPwd
     * @return
     */
    TradeUser userLogin(String userNo, String userPwd) throws ComponentException;

    /**
     *  用户注册功能业务接口
     * @param tradeUserVo
     * @return
     * @throws BusinessException
     * @throws ComponentException
     */
    TradeUser userRegister(TradeUserVo tradeUserVo) throws BusinessException, ComponentException;
}
