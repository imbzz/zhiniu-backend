package com.itcast.bulls.stock.common.system.service.impl;

import com.itcast.bulls.stock.common.system.dao.ITradeGlobalConfigDao;
import com.itcast.bulls.stock.common.system.service.ITradeGlobalConfigService;
import com.itcast.bulls.stock.entity.system.TradeGlobalConfig;
import com.itcast.bulls.stock.entity.system.TradeSeq;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>Description: 全局系统配置实现类 </p>
 * @date 2020/1/7
 * @author 贺锟 
 * @version 1.0
 * <p>Copyright:Copyright(c)2019</p>
 */
@Service
public class TradeGlobalConfigServiceImpl implements ITradeGlobalConfigService {

    /**
     * 全局系统配置信息数据层接口
     */
    @Autowired
    private ITradeGlobalConfigDao tradeGlobalConfigDao;

    /**
     * 根据编号获取全局系统配置信息
     * @param code
     * @return
     */
    @Override
    public TradeGlobalConfig getTradeGlobalConfigByCode(String code) {

        return tradeGlobalConfigDao.getByCode(code);
    }


    /**
     * 获取指定序列增长ID
     * @param code
     * @return
     */
    @Override
    public Long getNextSeqId(String code) {
        TradeSeq seq = new TradeSeq();
        seq.setCode(code);
        tradeGlobalConfigDao.getNextId(seq);
        return seq.getNextId();

    }



}
