package com.itcast.bulls.stock.task.cache;

import com.itcast.bull.stock.common.service.cache.AbstractCache;
import com.itcast.bulls.stock.entity.user.TradeAccount;
import com.itcast.bulls.stock.task.dao.biz.ITradeAccountDao;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.List;
import java.util.stream.Collectors;


/**
 * 账户数据缓存
 */
@Component
@Log4j2
public class AccountsCache extends AbstractCache<Long, TradeAccount> {

    @Autowired
    private ITradeAccountDao tradeAccountDao;

    /**
     * 初始化缓存， 十分钟刷新一次
     */
    @PostConstruct
    @Scheduled(fixedRate = 1000*600)
    public void initCache() {
        // 加载缓存
        loadCache();
        log.info("load accounts cache complete.");
    }

    @Override
    public void loadCache() {
        try {
            DATA_CACHE.clear();
            // 获取所有有效账户数据
            List<TradeAccount> accountList = tradeAccountDao.getAllValidAccounts();
            if (null != accountList && !accountList.isEmpty()) {
                DATA_CACHE = accountList.stream().collect(Collectors.toMap(TradeAccount::getId, a -> a, (k1, k2) -> k1));
            }
        }catch(Exception e) {
            log.error(" Load Cache Error! ==> " + e.getMessage(), e);
        }
    }

    /**
     * 根据账户ID获取用户ID
     * @param accountId
     * @return
     */
    public Long getUserId(Long accountId) {

        TradeAccount account = get(accountId);
        if(null != account) {
            return account.getUserId();
        }
        return null;
    }

}
