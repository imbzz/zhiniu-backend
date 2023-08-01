package com.itcast.bulls.stock.task.cache;

import com.itcast.bull.stock.common.service.cache.AbstractCache;
import com.itcast.bulls.stock.entity.product.TradeStock;
import com.itcast.bulls.stock.task.dao.biz.ITradeStockDao;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.List;
import java.util.stream.Collectors;


/**
 * 股票产品缓存
 */
@Component
@Log4j2
public class StocksCache extends AbstractCache<Long, TradeStock> {

    @Autowired
    private ITradeStockDao tradeStockDao;

    /**
     * 初始化缓存， 十分钟刷新一次
     */
    @PostConstruct
    @Scheduled(fixedRate = 1000*600)
    public void initCache() {
        // 加载缓存
        loadCache();
        log.info("load stocks cache complete.");
    }

    @Override
    public void loadCache() {
        try {
            DATA_CACHE.clear();
            // 查询数据库获取数据
            List<TradeStock> dataList = tradeStockDao.getAllValidStocks();
            if (null != dataList && !dataList.isEmpty()) {
                DATA_CACHE = dataList.stream().collect(Collectors.toMap(TradeStock::getId, a -> a, (k1, k2) -> k1));
            }
        }catch(Exception e) {
            log.error(" Load Cache Error! ==> " + e.getMessage(), e);
        }
    }

    /**
     * 根据股票ID获取编号
     * @param goodsId
     * @return
     */
    public String getCode(Long goodsId) {
        TradeStock stock = get(goodsId);
        if(null != stock) {
            return stock.getCode();
        }
        return null;
    }
}
