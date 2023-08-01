package com.itcast.bulls.stock.quote.config.sharding;

import com.itcast.bulls.stock.common.utils.GlobalConstants;
import io.shardingsphere.api.algorithm.sharding.PreciseShardingValue;
import io.shardingsphere.api.algorithm.sharding.standard.PreciseShardingAlgorithm;
import lombok.extern.log4j.Log4j2;

import java.util.Collection;

/**
 * <p>Description: 分配配置规则</p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@Log4j2
public class DataSourceTableAlg implements PreciseShardingAlgorithm<Integer> {

    /**
     * 分片配置规则
     * @param collection
     * @param preciseShardingValue
     * @return
     */
    @Override
    public String doSharding(Collection<String> collection, PreciseShardingValue<Integer> preciseShardingValue) {
        log.info("Process in DataSourceTableAlg.doSharding method, colletion: " + collection + ", preciseShardingValue: " + preciseShardingValue);
        String tableName = preciseShardingValue.getLogicTableName() + "_";
        try {
            // 分表规则配置, 根据周期类型映射不同的表(周期类型: 1分钟, 5分钟和30分钟.)
            Integer type = preciseShardingValue.getValue();
            if (type.equals(GlobalConstants.KLINE_PERIOD_60)) {
                // 1分钟周期
                tableName = tableName + "1";
            }else if(type.equals(GlobalConstants.KLINE_PERIOD_300)) {
                // 5分钟周期
                tableName = tableName + "5";
            }else if(type.equals(GlobalConstants.KLINE_PERIOD_1800)) {
                // 30分钟周期
                tableName = tableName + "30";
            }else {
                throw new Exception("Not Match Table Rule, type: " + type);
            }
            log.info("assign tableName: " + tableName);
            return tableName;
        }catch (Exception e) {
            log.error(e.getMessage(), e);
            throw new RuntimeException(e.getMessage());
        }
    }
}
