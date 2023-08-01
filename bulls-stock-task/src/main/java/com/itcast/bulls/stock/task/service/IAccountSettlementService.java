package com.itcast.bulls.stock.task.service;
/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
public interface IAccountSettlementService {

    /**
     * 生成账户的交割单数据
     * @param param
     */
    void generateAccountSettlement(String param);
}
