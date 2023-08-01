package com.itcast.bulls.stock.common.system.dao;


import com.itcast.bulls.stock.entity.system.TradeGlobalConfig;
import com.itcast.bulls.stock.entity.system.TradeSeq;
import org.springframework.stereotype.Repository;

/**
 * 全局系统配置数据层接口
 */
@Repository
public interface ITradeGlobalConfigDao {

    /**
     * 新增全局系统配置
     * @param record
     * @return
     */
    int insert(TradeGlobalConfig record);

    /**
     * 根据编号查询对象
     * @param code
     * @return
     */
    TradeGlobalConfig getByCode(String code);

    /**
     * 根据编号获取序列ID
     * @param code
     * @return
     */
    int getNextId(TradeSeq record);

}