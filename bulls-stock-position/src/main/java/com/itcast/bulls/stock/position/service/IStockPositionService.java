package com.itcast.bulls.stock.position.service;

import com.itcast.bulls.stock.entity.trade.TradePosition;

import java.util.List;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
public interface IStockPositionService {
    /**
     * 获取用户的所有持仓数据
     * @param accountId
     * @return
     */
    List<TradePosition> getAllPositions(Long accountId);
}
