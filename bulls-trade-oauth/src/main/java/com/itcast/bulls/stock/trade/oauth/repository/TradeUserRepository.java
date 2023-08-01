package com.itcast.bulls.stock.trade.oauth.repository;

import com.itcast.bulls.stock.entity.user.TradeUser;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

/**
 * <p>Description: </p>
 * @date 2020/1/2
 * @author 贺锟 
 * @version 1.0
 * <p>Copyright:Copyright(c)2019</p>
 */
@Repository("tradeUserRepository")
public interface TradeUserRepository extends PagingAndSortingRepository<TradeUser, Long>, JpaSpecificationExecutor<TradeUser> {

    /**
     * 根据用户账号获取用户对象
     * @param userNo
     * @return
     */
    public TradeUser findByUserNo(String userNo);
}
