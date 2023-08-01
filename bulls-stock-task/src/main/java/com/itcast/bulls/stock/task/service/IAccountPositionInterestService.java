package com.itcast.bulls.stock.task.service;

import org.springframework.transaction.annotation.Transactional;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
public interface IAccountPositionInterestService {
    /**
     * 生成账户的仓位利息
     * @param param
     */
    @Transactional(rollbackFor = Exception.class)
    void generateAccountPositionInterest(String param);
}
