package com.itcast.bulls.stock.deal.service.user.impl;

import com.itcast.bulls.stock.common.exception.ComponentException;
import com.itcast.bulls.stock.common.exception.constants.ApplicationErrorCodeEnum;
import com.itcast.bulls.stock.common.utils.GlobalConstants;
import com.itcast.bulls.stock.deal.dao.biz.IStockUserDao;
import com.itcast.bulls.stock.deal.dao.biz.ITradeAccountDao;
import com.itcast.bulls.stock.deal.dao.biz.ITradeStockDao;
import com.itcast.bulls.stock.deal.dao.trade.IAccountWarnSettingDao;
import com.itcast.bulls.stock.deal.service.user.ITradeUserService;
import com.itcast.bulls.stock.entity.bo.AccountWarnSettingBo;
import com.itcast.bulls.stock.entity.product.TradeStock;
import com.itcast.bulls.stock.entity.user.AccountWarnSetting;
import com.itcast.bulls.stock.entity.user.TradeAccount;
import com.itcast.bulls.stock.entity.user.TradeUser;
import com.itcast.bulls.stock.struct.grpc.trade.AccountWarnSettingRequest;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.PostConstruct;
import java.util.Date;
import java.util.List;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@Service
@Log4j2
public class TradeUserServiceImpl implements ITradeUserService {

    @Autowired
    private IAccountWarnSettingDao accountWarnSettingDao;

    @Autowired
    private CacheManager cacheManager;

    @Autowired
    private IStockUserDao stockUserDao;

    @Autowired
    private ITradeStockDao tradeStockDao;

    @Autowired
    private ITradeAccountDao tradeAccountDao;


    /**
     * 校验预警通知类型
     * @param notifyType
     * @throws ComponentException
     */
    private void checkNotifyType(String notifyType) throws ComponentException {
        // 为空直接抛出异常
        if(null == notifyType) {
            throw new ComponentException(ApplicationErrorCodeEnum.NOTIFY_TYPE_ERROR);
        }

        // 多种通知类型判断
        if(notifyType.contains(",")){
            String[] notifyTypeArr = notifyType.split(",");
            for (String type : notifyTypeArr) {
                if(!isValidNotifyType(type)) {
                    throw new ComponentException(ApplicationErrorCodeEnum.NOTIFY_TYPE_ERROR);
                }
            }
        }
        // 单一通知类型判断
        else {
            if(!isValidNotifyType(notifyType)) {
                throw new ComponentException(ApplicationErrorCodeEnum.NOTIFY_TYPE_ERROR);
            }
        }
    }


    /**
     * 校验预警记录类型
     * @param notifyType
     * @throws ComponentException
     */
    private void checkWarnType(Integer warnType) throws ComponentException {
        boolean isMatch = false;
        if(GlobalConstants.ACCOUNT_WARN_TYPE_STOP_PRIFIT == warnType) {
            isMatch = true;
        }else if(GlobalConstants.ACCOUNT_WARN_TYPE_STOP_LOSS == warnType){
            isMatch = true;
        }

        if(!isMatch) {
            throw new ComponentException(ApplicationErrorCodeEnum.WARN_TYPE_ERROR);
        }
    }

    /**
     * 判断通知类型是否合法
     * @param notifyType
     * @return
     */
    private boolean isValidNotifyType(String notifyType) {
        if(GlobalConstants.ACCOUNT_WARN_NOTIFY_TYPE_APP.equals(notifyType)) {
            return true;
        }else if(GlobalConstants.ACCOUNT_WARN_NOTIFY_TYPE_EMAIL.equals(notifyType)){
            return true;
        }else if(GlobalConstants.ACCOUNT_WARN_NOTIFY_TYPE_SMS.equals(notifyType)){
            return true;
        }else {
            return false;
        }
    }

    /**
     * 检查用户接收信息设置是否完善
     * @param request
     */
    private void checkReceiverInfo(AccountWarnSettingRequest request, TradeAccount tradeAccount) throws ComponentException{
        String notifyType = request.getNotifyType();
        if(notifyType.contains(GlobalConstants.ACCOUNT_WARN_NOTIFY_TYPE_SMS)) {
            // 短信通知， 检查是否设置手机号
            // 获取用户信息
            TradeUser user = stockUserDao.getById(tradeAccount.getUserId());
            if(StringUtils.isEmpty(user.getPhone())) {
                throw new ComponentException(ApplicationErrorCodeEnum.NOTIFY_TYPE_SMS_NOT_SET);
            }
        }

        if(notifyType.contains(GlobalConstants.ACCOUNT_WARN_NOTIFY_TYPE_EMAIL)) {
            // 邮件通知， 检查是否设置邮箱
            // 获取用户信息
            TradeUser user = stockUserDao.getById(tradeAccount.getUserId());
            if(StringUtils.isEmpty(user.getEmail())) {
                throw new ComponentException(ApplicationErrorCodeEnum.NOTIFY_TYPE_EMAIL_NOT_SET);
            }
        }
    }


    /**
     * 加载预警通知信息至缓存
     * @param request
     * @param tradeAccount
     * @param accountWarnSetting
     */
    private void loadAccountWarnSettingCache(TradeAccount tradeAccount, AccountWarnSetting accountWarnSetting) {
        // 设置预警通知所需信息
        AccountWarnSettingBo accountWarnSettingBo = new AccountWarnSettingBo();
        BeanUtils.copyProperties(accountWarnSetting, accountWarnSettingBo);
        TradeUser tradeUser = stockUserDao.getById(tradeAccount.getUserId());
        TradeStock stock = tradeStockDao.getById(accountWarnSetting.getStockId());
        if(null != stock) {
            accountWarnSettingBo.setStockCode(stock.getCode());
            accountWarnSettingBo.setStockName(stock.getName());
        }
        accountWarnSettingBo.setUserId(tradeUser.getId());
        accountWarnSettingBo.setUserNo(tradeUser.getUserNo());
        accountWarnSettingBo.setUserName(tradeUser.getName());


        accountWarnSettingBo.setEmail(tradeUser.getEmail());
        accountWarnSettingBo.setPhone(tradeUser.getPhone());

        // 更新缓存
        Cache cache = cacheManager.getCache(GlobalConstants.ACCOUNT_WARN_SETTING_STOCK_KEY + accountWarnSetting.getStockId());
        cache.put(tradeAccount.getId(), accountWarnSettingBo);
    }



    /**
     * 保存用户设置的预警信息
     * @param request
     * @throws ComponentException
     */
    @Override
    public void saveAccountWarnSetting(AccountWarnSettingRequest request) throws ComponentException {

        // 1. 根据账号ID获取交易账号对象
        TradeAccount tradeAccount = tradeAccountDao.getById(request.getAccountId());
        if(null == tradeAccount) {
            throw new ComponentException(ApplicationErrorCodeEnum.NOT_VALID_ACCOUNT);
        }

        // 2. 要去校验通知类型是否合法
        checkNotifyType(request.getNotifyType());

        // 3. 检查用户接收通知设置方式是否能够支持
        checkReceiverInfo(request, tradeAccount);

        // 4. 预警记录类型做检查, 判断是否系统支持的预警类型
        checkWarnType(request.getWarnType());

        // 5. 根据账号ID和股票产品ID, 查找获取账户的预警设置信息
        AccountWarnSetting accountWarnSetting = accountWarnSettingDao.getByAccountAndStock(request.getAccountId(), request.getStockId());
        // 如果是存在, 做更新处理; 如果不存在, 则新增记录
        Date curDate = new Date();
        if(null == accountWarnSetting) {
            // 新增
            accountWarnSetting = new AccountWarnSetting();
            accountWarnSetting.setAccountId(request.getAccountId());
            accountWarnSetting.setStockId(request.getStockId());
            accountWarnSetting.setCreateTime(curDate);
            accountWarnSetting.setUpdateTime(curDate);

            accountWarnSetting.setNotifyType(request.getNotifyType());
            accountWarnSetting.setWarnType(request.getWarnType());
            accountWarnSetting.setStopRate(request.getStopRate());
            accountWarnSettingDao.insert(accountWarnSetting);
        }else {
            // 更新
            accountWarnSetting.setUpdateTime(curDate);
            accountWarnSetting.setNotifyType(request.getNotifyType());
            accountWarnSetting.setWarnType(request.getWarnType());
            accountWarnSetting.setStopRate(request.getStopRate());
            accountWarnSettingDao.update(accountWarnSetting);
        }

        // 6. 加载预警通知信息至缓存
        loadAccountWarnSettingCache(tradeAccount, accountWarnSetting);

    }

    /**
     * 每天凌晨3点， 加载账户预警设置至缓存
     */
    @Override
    @PostConstruct
    @Scheduled(cron = "0 0 3 * * ?")
    public void scheduledAccountWarnSettingCache(){
        log.info("refresh accountWarnSettingCache...");
        List<AccountWarnSetting> warnSettingList = accountWarnSettingDao.getAll();
        if(null != warnSettingList && !warnSettingList.isEmpty()){
            warnSettingList.stream().forEach(setting -> {
                // 查找账户信息
                TradeAccount tradeAccount = tradeAccountDao.getById(setting.getAccountId());
                if(null !=  tradeAccount) {
                    // 加载至缓存
                    loadAccountWarnSettingCache(tradeAccount, setting);
                }else {
                    log.warn("no account info, id:{}, not load cache.", setting.getAccountId());
                }
            });
        }
    }
}
