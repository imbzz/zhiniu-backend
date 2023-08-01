package com.itcast.bulls.stock.common.system.service;

import com.itcast.bulls.stock.entity.system.TradeGlobalConfig;

/**
 * <p>Description: </p>
 * @date 2020/1/7
 * @author 贺锟 
 * @version 1.0
 * <p>Copyright:Copyright(c)2019</p>
 */
public interface ITradeGlobalConfigService {

    /**
     * 根据编号获取全局系统配置信息
     * @param code
     * @return
     */
    TradeGlobalConfig getTradeGlobalConfigByCode(String code);

    /**
     * 获取指定序列增长ID
     * @param code
     * @return
     */
    Long getNextSeqId(String code);
}
