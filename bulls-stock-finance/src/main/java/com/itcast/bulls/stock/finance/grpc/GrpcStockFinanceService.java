package com.itcast.bulls.stock.finance.grpc;

import com.itcast.bull.stock.common.service.lock.RedisLockService;
import com.itcast.bull.stock.common.service.utils.BeanAssistant;
import com.itcast.bulls.stock.common.exception.ComponentException;
import com.itcast.bulls.stock.common.utils.GlobalConstants;
import com.itcast.bulls.stock.entity.finance.TradeAccountSettlement;
import com.itcast.bulls.stock.finance.service.IStockFinanceService;
import com.itcast.bulls.stock.finance.vo.AccountOverviewVo;
import com.itcast.bulls.stock.struct.grpc.trade.*;
import io.grpc.stub.StreamObserver;
import io.seata.core.context.RootContext;
import lombok.extern.log4j.Log4j2;
import net.devh.boot.grpc.server.service.GrpcService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@GrpcService
@Log4j2
public class GrpcStockFinanceService extends StockFinanceServiceGrpc.StockFinanceServiceImplBase {

    /**
     * 资金服务的业务实现类
     */
    @Autowired
    private IStockFinanceService stockFinanceService;

    /**
     * 分布式锁的实现类
     */
    @Autowired
    private RedisLockService redisLockService;


    /**
     * 获取账户资金总览的接口
     * @param request
     * @param responseObserver
     */
    @Override
    public void getFinanceOverview(GetFinanceOverviewRequest request, StreamObserver<GetFinanceOverviewResponse> responseObserver) {
        GetFinanceOverviewResponse response = null;
        try {
            // 调用业务接口获取账户资金总览的信息
            AccountOverviewVo accountOverviewVo = stockFinanceService.calcAccountSummary(request.getAccountId());
            response = GetFinanceOverviewResponse.newBuilder()
                    .setDayProfit(accountOverviewVo.getDayProfit())
                    .setPositionProfit(accountOverviewVo.getPositionProfit())
                    .setTotalMarketAmount(accountOverviewVo.getTotalMarketAmount())
                    .setTotalAssets(accountOverviewVo.getTotalAssets())
                    .setBalance(accountOverviewVo.getBalance())
                    .setStatus(GlobalConstants.STATUS_OK).build();

        } catch (ComponentException e) {
            // 业务异常返回
            log.error(e.getMessage(), e);
            response = GetFinanceOverviewResponse.newBuilder().setStatus(e.getErrorCodeEnum().getCode()).setMessage(e.getErrorCodeEnum().getMessage()).build();
        } catch (Exception e) {
            // 系统异常信息返回
            log.error(e.getMessage(), e);
            response = GetFinanceOverviewResponse.newBuilder().setStatus(GlobalConstants.STATUS_ERROR).setMessage(e.getMessage()).build();
        }

        responseObserver.onNext(response);
        responseObserver.onCompleted();


    }

    /**
     * 更新账户资金余额
     * @param request
     * @param responseObserver
     */
    @Override
    public void updateAccountBalance(UpdateBalanceRequest request, StreamObserver<UpdateBalanceResponse> responseObserver) {
        log.info("Process in updateAccountBalance method, xid: " + request.getXid());
        UpdateBalanceResponse response = null;
        try {

            // 绑定分布式事务的全局标识ID
//            RootContext.bind(request.getXid());
            // STEP1: 加入分布式锁的控制处理
//            redisLockService.tryLock(request.getAccountId());
            // 更新账户资金
            long balance = stockFinanceService.updateBalance(request.getAccountId(), request.getAdjustBalance());

            response = UpdateBalanceResponse.newBuilder()
                    .setStatus(GlobalConstants.STATUS_OK)
                    .setBalance(balance)
                    .build();

        } catch (ComponentException e) {
            // 业务异常返回
            log.error(e.getMessage(), e);
            response = UpdateBalanceResponse.newBuilder().setStatus(e.getErrorCodeEnum().getCode()).setMessage(e.getErrorCodeEnum().getMessage()).build();
        } catch (Exception e) {
            // 系统异常信息返回
            log.error(e.getMessage(), e);
            response = UpdateBalanceResponse.newBuilder().setStatus(GlobalConstants.STATUS_ERROR).setMessage(e.getMessage()).build();
        }finally {
            // STEP2: 解锁处理
//            redisLockService.unlock(request.getAccountId());
        }

        responseObserver.onNext(response);
        responseObserver.onCompleted();
    }


    /**
     * 获取账户资金
     *
     * @param request
     * @param responseObserver
     */
    @Override
    public void getAccountBalance(GetBalanceRequest request,
                                  StreamObserver<GetBalanceResponse> responseObserver) {
        GetBalanceResponse response = null;
        try {
            // 获取账户资金余额
            long balance = stockFinanceService.getBalance(request.getAccountId());
            response = GetBalanceResponse.newBuilder()
                    .setStatus(GlobalConstants.STATUS_OK)
                    .setBalance(balance)
                    .build();

        } catch (ComponentException e) {
            // 业务异常返回
            log.error(e.getMessage(), e);
            response = GetBalanceResponse.newBuilder().setStatus(e.getErrorCodeEnum().getCode()).setMessage(e.getErrorCodeEnum().getMessage()).build();
        } catch (Exception e) {
            // 系统异常信息返回
            log.error(e.getMessage(), e);
            response = GetBalanceResponse.newBuilder().setStatus(GlobalConstants.STATUS_ERROR).setMessage(e.getMessage()).build();
        }

        responseObserver.onNext(response);
        responseObserver.onCompleted();

    }

    /**
     * 获取账户交割单数据
     *
     * @param request
     * @param responseObserver
     */
    @Override
    public void getAccountSettlement(GetAccountSettlementRequest request,
                                     StreamObserver<GetAccountSettlementResponse> responseObserver) {

        GetAccountSettlementResponse response = null;
        try {
            // 获取账户交割单数据
            List<TradeAccountSettlement> settlementList = stockFinanceService.getTradeAccountSettlements(request.getAccountId(),
                    request.getTimeStart(), request.getTimeEnd());

            GetAccountSettlementResponse.Builder responseBuilder = GetAccountSettlementResponse.newBuilder();
            if(null != settlementList && !settlementList.isEmpty()) {

                // 复制数据， 组装返回数据结构体
                settlementList.forEach(settlement -> {
                    GetAccountSettlementSingle.Builder settlementSingle = GetAccountSettlementSingle.newBuilder();
                    BeanAssistant.copyNotNullProps(settlement, settlementSingle, new String[]{"tradeTime", "createTime"});
                    settlementSingle.setTradeTime(settlement.getTradeTime().getTime());
                    settlementSingle.setCreateTime(settlement.getCreateTime().getTime());
                    responseBuilder.addGetAccountSettlementSingle(settlementSingle);
                });

            }

            response = responseBuilder.setStatus(GlobalConstants.STATUS_OK).build();

        } catch (ComponentException e) {
            // 业务异常返回
            log.error(e.getMessage(), e);
            response = GetAccountSettlementResponse.newBuilder().setStatus(e.getErrorCodeEnum().getCode()).setMessage(e.getErrorCodeEnum().getMessage()).build();
        } catch (Exception e) {
            // 系统异常信息返回
            log.error(e.getMessage(), e);
            response = GetAccountSettlementResponse.newBuilder().setStatus(GlobalConstants.STATUS_ERROR).setMessage(e.getMessage()).build();
        }

        responseObserver.onNext(response);
        responseObserver.onCompleted();

    }
}
