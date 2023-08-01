package com.itcast.bulls.stock.task.dao.biz;

import org.springframework.stereotype.Repository;

import com.itcast.bulls.stock.entity.user.TradeUser;


/**
 * <p>Description: </p>
 * @date 2019/7/21
 * @author 贺锟 
 * @version 1.0

 * <p>Copyright:Copyright(c)2019</p>
 */
@Repository
public interface IStockUserDao {


    /**
     * 根据用户账号获取用户对象
     * @param userNo
     * @return
     */
    TradeUser getByUserNo(String userNo);


    /**
     * 根据账号获取用户对象(会检查手机号/邮箱/账号)
     * @param account
     * @return
     */
    TradeUser getByAccount(String account);

}
