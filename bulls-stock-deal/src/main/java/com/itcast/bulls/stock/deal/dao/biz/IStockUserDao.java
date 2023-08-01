package com.itcast.bulls.stock.deal.dao.biz;

import com.itcast.bulls.stock.entity.user.TradeUser;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;

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
     * 根据ID获取用户对象
     * @param id
     * @return
     */
    TradeUser getById(Long id);

    /**
     * 更新用户登陆信息
     * @param id
     * @param lastLoginTime
     * @return
     */
    int updateUserLogin(@Param("id") Long id, @Param("lastLoginTime") Date lastLoginTime);

}
