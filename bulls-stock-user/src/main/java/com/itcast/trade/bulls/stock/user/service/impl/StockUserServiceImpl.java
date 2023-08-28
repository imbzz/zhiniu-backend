package com.itcast.trade.bulls.stock.user.service.impl;

import com.alibaba.csp.sentinel.annotation.SentinelResource;
import com.alibaba.csp.sentinel.slots.block.AbstractRule;
import com.alibaba.csp.sentinel.slots.block.BlockException;
import com.alibaba.csp.sentinel.slots.block.degrade.DegradeRule;
import com.alibaba.csp.sentinel.slots.block.flow.FlowRule;
import com.itcast.bulls.stock.common.constants.GlobalConfig;
import com.itcast.bulls.stock.common.constants.GlobalSeq;
import com.itcast.bulls.stock.common.encrypt.EncryptUtil;
import com.itcast.bulls.stock.common.exception.BusinessException;
import com.itcast.bulls.stock.common.exception.ComponentException;
import com.itcast.bulls.stock.common.exception.constants.ApplicationErrorCodeEnum;
import com.itcast.bulls.stock.common.system.service.ITradeGlobalConfigService;
import com.itcast.bulls.stock.common.utils.GlobalConstants;
import com.itcast.bulls.stock.entity.system.TradeGlobalConfig;
import com.itcast.bulls.stock.entity.user.TradeAccount;
import com.itcast.bulls.stock.entity.user.TradeUser;
import com.itcast.bulls.stock.starter.sender.service.MailSender;
import com.itcast.bulls.stock.starter.sender.vo.SenderMessage;
import com.itcast.stock.common.web.vo.user.TradeUserVo;
import com.itcast.trade.bulls.stock.user.dao.IStockUserDao;
import com.itcast.trade.bulls.stock.user.dao.ITradeAccountDao;
import com.itcast.trade.bulls.stock.user.service.IStockUserService;
import com.itcast.trade.bulls.stock.user.vo.CompanyVo;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@Service
@Log4j2
public class StockUserServiceImpl implements IStockUserService {


    @Autowired
    private IStockUserDao stockUserDao;
    @Autowired
    private ITradeGlobalConfigService tradeGlobalConfigService;
    @Autowired
    private ITradeAccountDao tradeAccountDao;

    /**
     *  邮件发送的服务接口
     */
    @Autowired
    private MailSender mailSender;
    /**
     * 用户登录限流处理逻辑
     * @param userNo
     * @param userPwd
     * @param ex
     * @return
     * @throws ComponentException
     */
    public TradeUser userLoginHandler(String userNo, String userPwd, BlockException ex) throws ComponentException {
        log.error("userLogin flow limit, call userLoginHandler: " + ex.getMessage());
        // 1. 获取熔断限流规则
        AbstractRule abstractRule = ex.getRule();

        // 2. 根据不同的规则, 进行不同逻辑处理
        if(abstractRule instanceof DegradeRule){
            throw new ComponentException(ApplicationErrorCodeEnum.SYS_BUSY);
        }else if(abstractRule instanceof FlowRule) {
            throw new ComponentException(ApplicationErrorCodeEnum.SYS_FLOW);
        }
        // 3. 默认, 未捕获对应异常, 不符合配置的规则,进入系统异常
        throw new ComponentException(ApplicationErrorCodeEnum.FAILURE);
    }


    /**
     * 用户登陆
     * @param userNo
     * @param userPwd
     * @return
     */
    @Override
    @SentinelResource(value = "userLogin", blockHandler = "userLoginHandler" )
    public TradeUser userLogin(String userNo, String userPwd) throws ComponentException {

        // 模拟降级异常，通过SentinelResource定向到上面的userLoginHandler函数
        if("error".equals(userNo)) {
            throw new ComponentException(ApplicationErrorCodeEnum.FAILURE);
        }

        // 1. 获取用户对象
        TradeUser tradeUser= stockUserDao.getByUserNo(userNo);
        if(null == tradeUser) {
            throw new ComponentException(ApplicationErrorCodeEnum.USER_NOT_FOUND);
        }

        // 2. 用户密码加密判断
        String encryptPassword = EncryptUtil.encryptSigned(userPwd);
        boolean pwdMatch= tradeUser.getUserPwd().equals(encryptPassword);
        if(!pwdMatch) {
            log.error(ApplicationErrorCodeEnum.USER_PWD_ERROR);
            throw new ComponentException(ApplicationErrorCodeEnum.USER_PWD_ERROR);
        }

        return tradeUser;
    }


    /**
     *  用户注册功能业务接口
     * @param tradeUserVo
     * @return
     * @throws BusinessException
     * @throws ComponentException
     */
    @Override
    public TradeUser userRegister(TradeUserVo tradeUserVo) throws BusinessException, ComponentException {
        // 1.判断用户是否已经注册
        TradeUser newTradeUser = new TradeUser();
        Integer checkResult = stockUserDao.checkRegister(tradeUserVo.getUserNo(), tradeUserVo.getEmail(), tradeUserVo.getPhone());
        if(null != checkResult && checkResult > 0) {
            throw new BusinessException(ApplicationErrorCodeEnum.USER_EXISTS);
        }

        // 2. 对公司信息做校验(传递的公司是合法的)
        CompanyVo companyVo = stockUserDao.getCompanyVoById(tradeUserVo.getCompanyId());
        if(null == companyVo) {
            throw new BusinessException(ApplicationErrorCodeEnum.USER_COMPANY_NOT_FOUND);
        }

        // 3. 构造生成用户信息
        BeanUtils.copyProperties(tradeUserVo, newTradeUser);
        newTradeUser.setUserNo(generateUserNo());
        newTradeUser.setUserPwd(EncryptUtil.encryptSigned(tradeUserVo.getUserPwd()));

        // 4. 完善并冗余必要的用户信息
        newTradeUser.setInstitutionId(companyVo.getInstitutionId());
        newTradeUser.setInstitutionTypeId(companyVo.getInstitutionTypeId());
        newTradeUser.setCompanyName(companyVo.getCompanyName());
        stockUserDao.insert(newTradeUser);


        // 5. 注册即开户, 生成交易账户信息
        TradeGlobalConfig tradeGlobalConfig = tradeGlobalConfigService.getTradeGlobalConfigByCode(GlobalConfig.REG_OPEN_ACCOUNT);
        if(null != tradeGlobalConfig && GlobalConfig.VALUE_TRUE.equals(tradeGlobalConfig.getValue())){
            // 如果存在该项配置, 并且值为Y, 代表注册即开户
            // 生成交易账户信息
            TradeAccount tradeAccount = new TradeAccount();
            tradeAccount.setAccountNo(generateUserAccountNo());
            tradeAccount.setUserId(newTradeUser.getId());
            // 先设置为系统默认组别
            tradeAccount.setTradeGroupId(1L);
            tradeAccount.setStatus(GlobalConfig.STATUS_VALID);
            tradeAccount.setActiveTime(new Date());

            // 冗余信息的设置
            tradeAccount.setInstitutionId(companyVo.getInstitutionId());
            tradeAccount.setInstitutionTypeId(companyVo.getInstitutionTypeId());
            tradeAccount.setCompanyId(companyVo.getId());
            tradeAccount.setUserName(newTradeUser.getName());
            tradeAccount.setTradeGroupName(GlobalConstants.DEFAULT_GROUP_NAME);
            tradeAccount.setBalance(0L);
            // 保存交易账户信息
            tradeAccountDao.insert(tradeAccount);
        }
        //  6. 发送邮件/短信通知
        tradeUserVo.setUserNo(newTradeUser.getUserNo());
        sendEmailMessage(tradeUserVo);
        return newTradeUser;
    }


    /**
     * 生成用户编号
     * @return
     */
    private String generateUserNo() {
        // 获取用户账号
        Long nextUserNo = tradeGlobalConfigService.getNextSeqId(GlobalSeq.USER_NO);
        log.info(" get the next userNo : " + nextUserNo);
        // 其中0表示补零, 后面标识长度
        return String.format("%08d", nextUserNo);
    }

    /**
     * 生成交易账户编号
     * @return
     */
    private String generateUserAccountNo() {
        // 获取用户账号
        Long nextUserNo = tradeGlobalConfigService.getNextSeqId(GlobalSeq.USER_ACC);
        log.info(" get the next userAccountNo : " + nextUserNo);
        // 其中0表示补零, 后面标识长度
        return String.format("%08d", nextUserNo);
    }


    /**
     * 发送邮件
     * @param tradeUser
     */
    private void sendEmailMessage(TradeUserVo tradeUser) {
        SenderMessage messages = new SenderMessage();
        messages.setSubject("智牛股注册成功通知");
        messages.setReceiver(tradeUser.getEmail());
        messages.setId(System.nanoTime());
        messages.setUpdateTime(new Date());
        messages.setNotifyContent("您的帐号注册成功! 用户名称: " + tradeUser.getName() + ", 帐号编号: " + tradeUser.getUserNo());
        // 异步方式发送邮件
        log.info("send regist email: " + messages);
        mailSender.sendMessage(messages);
    }
}