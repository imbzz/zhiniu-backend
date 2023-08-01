package com.itcast.bulls.stock.task.service.impl;

import com.itcast.bulls.stock.common.math.MathUtils;
import com.itcast.bulls.stock.common.utils.GlobalConstants;
import com.itcast.bulls.stock.entity.bo.AccountWarnSettingBo;
import com.itcast.bulls.stock.entity.quote.TradeStockQuoteLast;
import com.itcast.bulls.stock.entity.trade.AccountWarnNotifyMessage;
import com.itcast.bulls.stock.entity.user.AccountWarnTemplate;
import com.itcast.bulls.stock.starter.sender.base.IWarnNotifySender;
import com.itcast.bulls.stock.starter.sender.vo.SenderMessage;
import com.itcast.bulls.stock.starter.sender.vo.SenderResult;
import com.itcast.bulls.stock.task.cache.StocksCache;
import com.itcast.bulls.stock.task.dao.trade.IAccountWarnNotifyMessageDao;
import com.itcast.bulls.stock.task.service.IAccountWarnSettingService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.core.task.TaskExecutor;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Set;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@Service
@Log4j2
public class AccountWarnSettingServiceImpl implements IAccountWarnSettingService {
    @Autowired
    private CacheManager cacheManager;

    @Autowired
    private TaskExecutor taskExecutor;

    @Autowired
    private StocksCache stocksCache;

    @Autowired
    private RedisTemplate redisTemplate;

    @Autowired
    private IAccountWarnNotifyMessageDao accountWarnNotifyMessageDao;

    @Autowired
    private IWarnNotifySender appSender;

    @Autowired
    private IWarnNotifySender smsSender;

    @Autowired
    private IWarnNotifySender mailSender;

    /**
     * 获取股票产品的最新报价
     *
     * @param stockId
     * @return
     * @throws ComponentException
     */
    private TradeStockQuoteLast getTradeStockQuoteLast(Long stockId) {

        // 从缓存获取数据
        Cache lastPriceCache = cacheManager.getCache(GlobalConstants.STOCK_QUOTE_LAST_PRICE_KEY);
        Cache.ValueWrapper quoteLastWrapper = lastPriceCache.get(stockId);
        TradeStockQuoteLast quoteLast = null;
        if (quoteLastWrapper != null) {
            quoteLast = (TradeStockQuoteLast) quoteLastWrapper.get();
        }

        return quoteLast;
    }

    /**
     * 保存预警通知信息
     * @param accountWarnSettingBo
     * @param quoteLast
     */
    private void saveAccountWarnNotifyMessage(AccountWarnSettingBo accountWarnSettingBo, TradeStockQuoteLast quoteLast) {

        String notifyType = accountWarnSettingBo.getNotifyType();
        if(notifyType.contains(",")){
            // 多种通知类型
            String[] notifyTypeArr = notifyType.split(",");
            for (String type : notifyTypeArr) {
                doNotifyMessage(accountWarnSettingBo, type.trim(), quoteLast);
            }

        }else{
            // 单一通知类型
            doNotifyMessage(accountWarnSettingBo, notifyType, quoteLast);
        }


    }

    /**
     * 检查账户预警设置(十分钟之内， 不重复预警处理)
     * @param accountWarnSettingBo
     * @return
     */
    private boolean checktAccountWarnSetting(AccountWarnSettingBo accountWarnSettingBo){

        if(accountWarnSettingBo.getLastWarnRecordTime() ==  null ) {
            // 第一次预警
            return true;
        }

        long diffTime = System.currentTimeMillis()  - accountWarnSettingBo.getLastWarnRecordTime();
        if(diffTime > 600000) {
            return true;
        }else {
            log.warn("check account warn setting, time in period, not generate data. ");
        }

        return false;
    }

    /**
     * 处理生成通知数据
     * @param accountWarnSettingBo
     * @param type
     * @param quoteLast
     */
    private void doNotifyMessage(AccountWarnSettingBo accountWarnSettingBo, String type, TradeStockQuoteLast quoteLast) {
        log.info("Process in doNotifyMessage method, warnType: " + accountWarnSettingBo.getWarnType()
                + ", stopRate: " + accountWarnSettingBo.getStopRate()+ ", type: " + type + ", priceRate: " + quoteLast.getPriceRate());
        ;
        if(accountWarnSettingBo.getWarnType() == GlobalConstants.ACCOUNT_WARN_TYPE_STOP_LOSS ) {
            // 止损
            if(accountWarnSettingBo.getStopRate() >= quoteLast.getPriceRate()) {
                recordNotifyMessage(accountWarnSettingBo, type, quoteLast);
            }
        }else if(accountWarnSettingBo.getWarnType() == GlobalConstants.ACCOUNT_WARN_TYPE_STOP_PRIFIT){
            // 止盈
            if(accountWarnSettingBo.getStopRate() <= quoteLast.getPriceRate()) {
                recordNotifyMessage(accountWarnSettingBo, type, quoteLast);
            }
        }
    }


    /**
     * 记录通知消息
     * @param accountWarnSettingBo
     * @param type
     */
    private void recordNotifyMessage(AccountWarnSettingBo accountWarnSettingBo, String type, TradeStockQuoteLast quoteLast) {

        // 模板处理
        Cache cache = cacheManager.getCache(GlobalConstants.ACCOUNT_WARN_TEMPLATE_TYPE_KEY);
        if(null != cache && null != cache.get(accountWarnSettingBo.getWarnType())) {
            AccountWarnNotifyMessage notifyMessage = new AccountWarnNotifyMessage();
            AccountWarnTemplate accountWarnTemplate = (AccountWarnTemplate) cache.get(accountWarnSettingBo.getWarnType()).get();
            String content = accountWarnTemplate.getContent();
            content = content.replace("${stockCode}", accountWarnSettingBo.getStockCode())
                    .replace("${stockPrice}", String.valueOf(MathUtils.round2Double(quoteLast.getLastPrice(), 2)))
                    .replace("${stopProfitRate}", accountWarnSettingBo.getStopRate() + "%");

            notifyMessage.setNotifyContent(content);
            notifyMessage.setAccountId(accountWarnSettingBo.getAccountId());
            notifyMessage.setUserId(accountWarnSettingBo.getUserId());
            if(GlobalConstants.ACCOUNT_WARN_NOTIFY_TYPE_SMS.equals(type)) {
                // 短信
                notifyMessage.setReceiver(accountWarnSettingBo.getPhone());
            }else if(GlobalConstants.ACCOUNT_WARN_NOTIFY_TYPE_EMAIL.equals(type)){
                // 邮件
                notifyMessage.setReceiver(accountWarnSettingBo.getEmail());
            }else if(GlobalConstants.ACCOUNT_WARN_NOTIFY_TYPE_APP.equals(type)){
                // 站内信
                notifyMessage.setReceiver(String.valueOf(accountWarnSettingBo.getAccountId()));
            }
            notifyMessage.setNotifyType(type);
            notifyMessage.setRetryTimes(0);
            notifyMessage.setWarnType(accountWarnSettingBo.getWarnType());
            notifyMessage.setUpdateTime(new Date());

            notifyMessage.setUserNo(accountWarnSettingBo.getUserNo());
            notifyMessage.setUserName(accountWarnSettingBo.getUserName());
            notifyMessage.setNotifyTitle(accountWarnTemplate.getTitle());

            // 保存数据
            accountWarnNotifyMessageDao.insert(notifyMessage);

            // 更新缓存， 记录生成时间
            accountWarnSettingBo.setLastWarnRecordTime(System.currentTimeMillis());

        }else {
            log.warn("not found valid account warn template, warnType: " + accountWarnSettingBo.getWarnType());
        };


    }

    /**
     * 生成预警通知记录的接口实现
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void generateWarnNotifyMessage() {
        // 1. 遍历所有的有效股票产品
        stocksCache.getKeys().forEach(stockId -> {
            TradeStockQuoteLast quoteLast = getTradeStockQuoteLast(stockId);
            if(null != quoteLast) {
                // 2. 根据股票产品ID获取所有的KEY
                Set<String> keys = redisTemplate.keys(GlobalConstants.ACCOUNT_WARN_SETTING_STOCK_KEY + stockId + "*");
                if(null != keys && !keys.isEmpty()) {
                    String prefixKey = GlobalConstants.ACCOUNT_WARN_SETTING_STOCK_KEY + stockId;
                    Cache cache = cacheManager.getCache(prefixKey);
                    // 3. 遍历对应股票产品下面的所有账户设置的预警信息
                    keys.forEach( key -> {
                        // 4. 根据股票产品ID, 获取账户的预警通知设置信息
                        Cache.ValueWrapper valueWrapper = cache.get(key.replaceAll(prefixKey + "::", ""));
                        if(null != cache  && null != valueWrapper) {
                            AccountWarnSettingBo accountWarnSettingBo = (AccountWarnSettingBo)valueWrapper.get();
                            // 5. 检查预警通知记录, 是否第一次生成, 或者是上一次预警通知超过十分钟
                            if(checktAccountWarnSetting(accountWarnSettingBo)) {
                                // 6. 生成预警通知记录信息
                                saveAccountWarnNotifyMessage(accountWarnSettingBo, quoteLast);
                                accountWarnSettingBo.setNotifyTimes(accountWarnSettingBo.getNotifyTimes() + 1);
                                cache.put(accountWarnSettingBo.getAccountId(), accountWarnSettingBo);
                            }

                            // 7. 判断预警通知记录的通知次数, 如果超过3次, 当天不再生成预警通知, 将账户的缓存记录移除
                            if(accountWarnSettingBo.getNotifyTimes() >= 3) {
                                cache.evict(accountWarnSettingBo.getAccountId());
                            }
                        }
                    });

                }else {
                    log.info("Not Found Account Warn Settings Info, StockId: " + stockId);
                }

            }else {
                log.info("TradeStockQuoteLast Not Found, StockId: " + stockId);
            }
        });

    }


    /**
     * 发送预警通知数据
     */
    @Override
    public void sendWarnNotifyMessage() {

        // 1. 获取所有需要推送的预警消息 (状态为发送不成功， 并且发送次数小于3次)， 每次获取1000条
        List<AccountWarnNotifyMessage> accountWarnNotifyMessages = accountWarnNotifyMessageDao.getAllNeedNotifyData();
        if(null != accountWarnNotifyMessages && !accountWarnNotifyMessages.isEmpty()) {
            log.info("sendWarnNotifyMessage, data size: " + accountWarnNotifyMessages.size());

            // 2. 并行流方式发送通知数据， 提升处理速度
            accountWarnNotifyMessages.parallelStream().forEach(notifyMessage -> {
                // 3. 根据发送通知数据不同的消息类型， 调用相应接口发送消息
                SenderResult result = null;
                if(GlobalConstants.ACCOUNT_WARN_NOTIFY_TYPE_APP.equals(notifyMessage.getNotifyType())) {
                    // 站内信通知
                    result = appSender.sendSyncMessage(getSenderMessage(notifyMessage));
                }if(GlobalConstants.ACCOUNT_WARN_NOTIFY_TYPE_SMS.equals(notifyMessage.getNotifyType())) {
                    // 阿里云短信通知
                    result = smsSender.sendSyncMessage(getSenderMessage(notifyMessage));
                }if(GlobalConstants.ACCOUNT_WARN_NOTIFY_TYPE_EMAIL.equals(notifyMessage.getNotifyType())) {
                    // 阿里云邮件通知
                    result = mailSender.sendSyncMessage(getSenderMessage(notifyMessage));
                }else{
                    log.warn("no support notify type, pls check! notifyType: " + notifyMessage.getNotifyType());
                    notifyMessage.setMemo("no support type!");
                }
                // 4. 更新发送信息, 消息发送次数会累加1
                accountWarnNotifyMessageDao.updateNotifyDataSendStatus(result);
            });
        }
    }


    /**
     * 发送预警通知消息
     * @param notifyMessage
     * @return
     */
    private SenderMessage getSenderMessage(AccountWarnNotifyMessage notifyMessage) {
        SenderMessage message = new SenderMessage();
        message.setSubject("账户预警通知");
        message.setNotifyContent(notifyMessage.getNotifyContent());
        message.setId(notifyMessage.getId());
        message.setAccountId(notifyMessage.getAccountId());
        message.setReceiver(notifyMessage.getReceiver());
        message.setUpdateTime(notifyMessage.getUpdateTime());
        return message;
    }
}
