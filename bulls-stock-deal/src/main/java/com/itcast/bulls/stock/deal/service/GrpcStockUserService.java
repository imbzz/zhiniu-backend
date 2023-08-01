package com.itcast.bulls.stock.deal.service;
/**
 * <p>Description: </p>
 * @date 2020/1/22
 * @author 贺锟 
 * @version 1.0
 * @name  Mirson
 * <p>Copyright:Copyright(c)2019</p>
 */

import com.itcast.bulls.stock.common.encrypt.EncryptUtil;
import com.itcast.bulls.stock.common.exception.ComponentException;
import com.itcast.bulls.stock.common.utils.GlobalConstants;
import com.itcast.bulls.stock.deal.dao.biz.IStockUserDao;
import com.itcast.bulls.stock.deal.dao.biz.ITradeAccountDao;
import com.itcast.bulls.stock.deal.service.user.ITradeUserService;
import com.itcast.bulls.stock.entity.user.TradeAccount;
import com.itcast.bulls.stock.entity.user.TradeUser;
import com.itcast.bulls.stock.struct.grpc.trade.*;
import io.grpc.stub.StreamObserver;
import lombok.extern.log4j.Log4j2;
import net.devh.boot.grpc.server.service.GrpcService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;

/**
 * Grpc的用户相关接口实现类
 */
@GrpcService
@Log4j2
public class GrpcStockUserService extends StockUserServiceGrpc.StockUserServiceImplBase {

    /**
     * 用户管理的数据层接口
     */
    @Autowired
    private IStockUserDao stockUserDao;

    /**
     * 交易账户管理的数据层接口
     */
    @Autowired
    private ITradeAccountDao tradeAccountDao;

    /**
     * 用户服务层接口
     */
    @Autowired
    private ITradeUserService tradeUserService;

    /**
     * 用户登陆处理
     *
     * @param request
     * @param responseObserver
     */
    @Override
    public void userLogin(LoginRequest request,
                          StreamObserver<LoginReponse> responseObserver) {

        LoginReponse reponse = null;
        try {
            // 1. 根据传递的用户编号, 获取用户对象
            TradeUser tradeUser = stockUserDao.getByUserNo(request.getUserNo());
            if (null == tradeUser) {
                // 做校验判断, 如果不存在, 则抛出异常提示
                reponse = LoginReponse.newBuilder().setStatus(GlobalConstants.STATUS_ERROR).setMessage("用户不存在！").build();
            } else {
                //2. 用户密码校验, 进行加密判断
                String encryptPassword = EncryptUtil.encryptSigned(request.getUserPwd());
                boolean pwdMatch = tradeUser.getUserPwd().equals(encryptPassword);
                if (!pwdMatch) {
                    // 密码不一致, 抛出异常提示
                    reponse = LoginReponse.newBuilder().setStatus(GlobalConstants.STATUS_ERROR).setMessage("用户密码错误！").build();
                } else {
                    // 3. 返回用户登陆成功信息
                    TradeAccount tradeAccount = tradeAccountDao.getByUserId(tradeUser.getId());
                    // 4. 更新用户登陆的相关信息
                    stockUserDao.updateUserLogin(tradeUser.getId(), new Date());
                    reponse = LoginReponse.newBuilder().setStatus(GlobalConstants.STATUS_OK)
                            .setUserId(tradeUser.getId())
                            .setAccountId(tradeAccount.getId())
                            .setMessage("用户登陆成功！").build();
                    log.info("用户{}登陆成功！", tradeUser.getName());

                }
            }

        } catch (Exception e) {
            log.error(e.getMessage(), e);
            reponse = LoginReponse.newBuilder().setStatus(GlobalConstants.STATUS_ERROR).setMessage(e.getMessage()).build();
        }
        responseObserver.onNext(reponse);
        responseObserver.onCompleted();


    }

    /**
     * <pre>
     * 账户预警设置
     * </pre>
     */
    public void accountWarnSetting(AccountWarnSettingRequest request,
                                   StreamObserver<AccountWarnSettingResponse> responseObserver) {


        log.info("Process in GrpcStockUserService.accountWarnSetting, request: " + request);
        AccountWarnSettingResponse reponse = null;

        try {
            // 设置账户预警信息
            tradeUserService.saveAccountWarnSetting(request);
            reponse = AccountWarnSettingResponse.newBuilder().setStatus(GlobalConstants.STATUS_OK).build();
        }catch(ComponentException e) {
            // 业务异常返回
            log.error(e.getMessage(), e);
            reponse = AccountWarnSettingResponse.newBuilder().setStatus(e.getErrorCodeEnum().getCode()).setMessage(e.getErrorCodeEnum().getMessage()).build();
        }catch(Exception e) {
            // 系统异常信息返回
            log.error(e.getMessage(), e);
            reponse = AccountWarnSettingResponse.newBuilder().setStatus(GlobalConstants.STATUS_ERROR).setMessage(e.getMessage() == null ? "null":e.getMessage()).build();
        }

        responseObserver.onNext(reponse);
        responseObserver.onCompleted();

    }



}