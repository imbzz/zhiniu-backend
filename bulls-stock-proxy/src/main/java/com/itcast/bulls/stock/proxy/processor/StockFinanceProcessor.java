package com.itcast.bulls.stock.proxy.processor;

import com.itcast.bull.stock.common.service.utils.BeanAssistant;
import com.itcast.bulls.stock.common.exception.ComponentException;
import com.itcast.bulls.stock.common.utils.GlobalConstants;
import com.itcast.bulls.stock.struct.grpc.trade.*;
import com.itcast.bulls.stock.struct.netty.trade.*;
import io.netty.channel.ChannelHandlerContext;
import lombok.extern.log4j.Log4j2;
import net.devh.boot.grpc.client.inject.GrpcClient;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@Service
@Log4j2
public class StockFinanceProcessor extends AbstractStockProcessor implements IBaseStockProcessor {

    @GrpcClient("grpc-finance-server")
    private StockFinanceServiceGrpc.StockFinanceServiceBlockingStub stockFinanceServiceStub;

    /**
     * 处理客户端请求
     * @param channelHandlerContext
     * @param stockMessage
     */
    @Override
    public void processRequest(ChannelHandlerContext channelHandlerContext, StockMessage stockMessage) {

        switch (stockMessage.getStockHead().getRequestType()) {
            case GET_FINANCE_OVERVIEW:
                getFinanceOverview(channelHandlerContext, stockMessage);
                break;
            case GET_ACCOUNT_SETTLEMENTS:
                getAccountSettlements(channelHandlerContext, stockMessage);
                break;
            default:
                log.error("Process in StockDealProcessor.processRequest method => Not Match RequestType!");
        }

    }


    /**
     * 获取账户资金总览信息
     * @param channelHandlerContext
     * @param stockMessage
     */
    private void getFinanceOverview(ChannelHandlerContext channelHandlerContext, StockMessage stockMessage) {

        ResponseMessage responseMessage = null;
        StockHeadProto.StockHead stockHead = null;
        try {
            // 构造请求信息
            GetFinanceOverviewRequest request = GetFinanceOverviewRequest.newBuilder()
                    .setAccountId(getUserAccountId(channelHandlerContext))
                    .build();
            final GetFinanceOverviewResponse response = stockFinanceServiceStub.getFinanceOverview(request);
            log.info("Process in StockFinanceProcessor.getFinanceOverview receive: " + response);

            // 复制数据
            GetFinanceOverviewResp.Builder financeOverviewBuilder = GetFinanceOverviewResp.newBuilder();
            BeanUtils.copyProperties(response, financeOverviewBuilder);

            // 返回成功报文
            stockHead = generateStockHead(stockMessage.getStockHead(), response.getStatus());
            responseMessage = ResponseMessage.newBuilder()
                    .setStockHead(stockHead).setMessage(response.getMessage())
                    .setGetFinanceOverviewResp(financeOverviewBuilder).build();

        }catch(ComponentException e) {
            // 业务异常返回
            log.error(e.getMessage(), e);
            stockHead = generateStockHead(stockMessage.getStockHead(), e.getErrorCodeEnum().getCode());
            responseMessage = ResponseMessage.newBuilder().setStockHead(stockHead).setMessage(e.getErrorCodeEnum().getMessage()).build();
        }catch (Exception e) {
            // 系统异常返回
            log.error(e.getMessage(), e);
            stockHead = generateStockHead(stockMessage.getStockHead(), GlobalConstants.STATUS_ERROR);
            responseMessage = ResponseMessage.newBuilder().setStockHead(stockHead).setMessage(e.getMessage()).build();
        }
        channelHandlerContext.writeAndFlush(responseMessage);
        log.info("Process in StockFinanceProcessor.getFinanceOverview write : " + responseMessage);

    }

    /**
     * 获取账户交割单信息
     * @param channelHandlerContext
     * @param stockMessage
     */
    private void getAccountSettlements(ChannelHandlerContext channelHandlerContext, StockMessage stockMessage) {

        ResponseMessage responseMessage = null;
        StockHeadProto.StockHead stockHead = null;
        try {

            GetAccountSettlementData accountSettlementData = stockMessage.getGetAccountSettlementData();

            // 构造请求信息
            GetAccountSettlementRequest request = GetAccountSettlementRequest.newBuilder()
                    .setAccountId(getUserAccountId(channelHandlerContext))
                    .setTimeStart(accountSettlementData.getTimeStart())
                    .setTimeEnd(accountSettlementData.getTimeEnd())
                    .build();
            final GetAccountSettlementResponse response = stockFinanceServiceStub.getAccountSettlement(request);
            log.info("Process in StockFinanceProcessor.getAccountSettlements receive: " + response);

            // 复制数据
            GetAccountSettlementRespDataList.Builder settlementRespDataList = GetAccountSettlementRespDataList.newBuilder();
            if(null != response && response.getGetAccountSettlementSingleCount() > 0 ) {
                response.getGetAccountSettlementSingleList().forEach(settlement -> {
                    GetAccountSettlementRespData.Builder  settlementRespData = GetAccountSettlementRespData.newBuilder();
                    BeanAssistant.copyNotNullProps(settlement, settlementRespData);
                    settlementRespDataList.addGetAccountSettlementRespData(settlementRespData);
                });
            }
            // 返回成功报文
            stockHead = generateStockHead(stockMessage.getStockHead(), response.getStatus());
            responseMessage = ResponseMessage.newBuilder()
                    .setStockHead(stockHead).setMessage(response.getMessage())
                    .setGetAccountSettlementRespDataList(settlementRespDataList).build();

        }catch(ComponentException e) {
            // 业务异常返回
            log.error(e.getMessage(), e);
            stockHead = generateStockHead(stockMessage.getStockHead(), e.getErrorCodeEnum().getCode());
            responseMessage = ResponseMessage.newBuilder().setStockHead(stockHead).setMessage(e.getErrorCodeEnum().getMessage()).build();
        }catch (Exception e) {
            // 系统异常返回
            log.error(e.getMessage(), e);
            stockHead = generateStockHead(stockMessage.getStockHead(), GlobalConstants.STATUS_ERROR);
            responseMessage = ResponseMessage.newBuilder().setStockHead(stockHead).setMessage(e.getMessage()).build();
        }
        channelHandlerContext.writeAndFlush(responseMessage);
        log.info("Process in StockFinanceProcessor.getAccountSettlements write : " + responseMessage);

    }

}
