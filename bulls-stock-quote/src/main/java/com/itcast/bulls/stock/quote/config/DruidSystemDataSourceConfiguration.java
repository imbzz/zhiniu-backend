package com.itcast.bulls.stock.quote.config;

import com.alibaba.druid.pool.DruidDataSource;
import com.itcast.bulls.stock.quote.config.sharding.DataSourceTableAlg;
import io.shardingsphere.api.config.rule.ShardingRuleConfiguration;
import io.shardingsphere.api.config.rule.TableRuleConfiguration;
import io.shardingsphere.api.config.strategy.StandardShardingStrategyConfiguration;
import io.shardingsphere.shardingjdbc.api.ShardingDataSourceFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

import javax.sql.DataSource;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Properties;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@Configuration
public class DruidSystemDataSourceConfiguration {

    /***
     * 业务数据源
     * @return
     */
    @Bean(name = "bizSystemDataSource")
    @ConfigurationProperties(prefix = "spring.datasource.bizsystem")
    public DataSource bizSystemDataSource() {
        return new DruidDataSource();
    }

    /**
     * 交易数据源
     * @return
     */
    @Bean(name = "tradeDruidDataSource")
    @ConfigurationProperties(prefix = "spring.datasource.tradesystem")
    public DruidDataSource tradeDruidDataSource() {
        return new DruidDataSource();
    }

    /**
     * 交易数据源Sharding JDBC配置
     * @param tradeDruidDataSource
     * @return
     * @throws Exception
     */
    @Bean(name = "tradeSystemDataSource")
    @Primary
    public DataSource tradeSystemDataSource(@Autowired DruidDataSource tradeDruidDataSource) throws Exception {
        // 定义sharding jdbc 配置处理规则
        ShardingRuleConfiguration shardJdbcConfig = new ShardingRuleConfiguration();
        shardJdbcConfig.getTableRuleConfigs().add(getKlineTableRule());
        shardJdbcConfig.setDefaultDataSourceName("ds_0");
        // 加入分库信息配置
        Map<String, DataSource> dataSourceMap = new LinkedHashMap<>();
        dataSourceMap.put("ds_0", tradeDruidDataSource);
        // 多个分库配置
//        dataSourceMap.put("ds_1", tradeDruidDataSource);
//        dataSourceMap.put("ds_2", tradeDruidDataSource)
        Properties properties = new Properties();
        properties.put("sql.show", true);
        return ShardingDataSourceFactory.createDataSource(dataSourceMap, shardJdbcConfig, new HashMap<>(), properties);

        
    }

    /**
     * K线行情表的分表配置处理规则
     * @return
     */
    private TableRuleConfiguration getKlineTableRule() {
        TableRuleConfiguration result = new TableRuleConfiguration();
        result.setLogicTable("t_trade_stock_kline");
        // 分库规则配置, 配置实际的分库与分片信息
        //result.setActualDataNodes("ds_${0..3}.t_trade_stock_kline_${0..9}");
        result.setActualDataNodes("ds_0.t_trade_stock_kline_1,ds_0.t_trade_stock_kline_5, ds_0.t_trade_stock_kline_30");
        // 将分片规则设置进去
        result.setTableShardingStrategyConfig(new StandardShardingStrategyConfiguration("dataType", new DataSourceTableAlg()));
        return result;
    }
}
