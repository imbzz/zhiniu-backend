package com.itcast.bulls.stock.proxy.test;

import com.google.protobuf.Message;
import com.itcast.bulls.stock.common.generator.DateUtils;
import com.itcast.bulls.stock.struct.netty.trade.*;
import io.netty.channel.Channel;
import lombok.extern.log4j.Log4j2;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@Log4j2
public class BusinessHandler {

    private Channel ctx;

    /**
     * 消息的序列号ID
     */
    private static Long seqId = 0L;

    public BusinessHandler(Channel ctx) {
        this.ctx = ctx;
    }

    /**
     * 通过连接通道发送指定的消息
     * @param msg
     */
    private void sendMsg(Message msg) {
        if(null == ctx || null == msg || !ctx.isWritable()) {
            return;
        }
        ctx.writeAndFlush(msg);
    }


    /**
     * 账户预警通知设置
     * @param ctx
     */
    public void accountWarnSetting() {

        String notifyType = "EMAIL,APP,SMS";
        long stockId = 4;
        // 单位：%， 例2.28 代表02.28%
        double stopRate = 1.06;
        int warnType = 1;

        System.out.println("****** Send Account Warn Setting, Parameters ****** ");
        System.out.println("== notifyType: " + notifyType);
        System.out.println("== stockId: " + stockId);
        System.out.println("== stopRate: " + stopRate);
        System.out.println("== warnType: " + warnType);

        // 构造头部信息
        StockHeadProto.StockHead stockHead = StockHeadProto.StockHead.newBuilder().setSeqId(seqId++).setRequestType(
                StockHeadProto.RequestType.ACCOUNT_WARN_SETTING).build();

        // 构造信息（stopRate, 单位：‱）
        AccountWarnSettingData settingData = AccountWarnSettingData.newBuilder()
                .setNotifyType(notifyType).setStockId(stockId).setStopRate(stopRate)
                .setWarnType(warnType).build();

        // 组装请求信息
        StockMessage stockMessage = StockMessage.newBuilder().setStockHead(stockHead).setAccountWarnSettingData(settingData).build();

        // 发送消息至服务端
        sendMsg(stockMessage);
    }


    /**
     * 下单数据接口
     */
    public void placeOrder(){
        // 下单方向
        int direct = 0;
        // 请求价格
        long execPrice = 5713;
        // 成交量
        int volume = 100;
        // 股票ID
        int stockId = 4;
        // 委托类型(0:市价单, 1: 限价单)
        int type = 0;

        System.out.println("****** Send Place Order , Params ******");
        System.out.println("== direct:" + direct);
        System.out.println("== execPrice:" + execPrice);
        System.out.println("== volume:" + volume);
        System.out.println("== stockId:" + stockId);
        System.out.println("== type:" + type);

        // 构造头部消息
        StockHeadProto.StockHead stockHead = StockHeadProto.StockHead.newBuilder()
                .setSeqId(seqId++).setRequestType(StockHeadProto.RequestType.PLACE_ORDER).build();

        // 构造订单信息
        PlaceOrderData orderData = PlaceOrderData.newBuilder()
                .setDirection(direct).setExecPrice(execPrice)
                .setExecVolume(volume).setStockId(stockId).setType(type).build();
        // 组装请求消息数据包
        StockMessage stockMessage = StockMessage.newBuilder().setStockHead(stockHead)
                .setPlaceOrderData(orderData).build();
        // 发送消息至服务端
        sendMsg(stockMessage);
    }


    /**
     * 用户登录接口
     */
    public void userLogin() {
        String userNo = "admin";
        String userPwd = "admin";
        System.out.println("******* Send User Login, Parameters *******");
        System.out.println("== useNo : " + userNo );
        System.out.println("== userPwd: " + userPwd);

        // 构造头部信息
        StockHeadProto.StockHead stockHead = StockHeadProto.StockHead.newBuilder().setSeqId(seqId ++ ).setRequestType(StockHeadProto.RequestType.USER_LOGIN).build();
        // 构造用户登录请求数据包
        LoginData loginData = LoginData.newBuilder().setUserNo(userNo).setUserPwd(userPwd).build();
        // 组装请求数据包
        StockMessage stockMessage = StockMessage.newBuilder().setStockHead(stockHead).setLoginData(loginData).build();
        // 发送消息至服务端
        sendMsg(stockMessage);
    }


    /**
     * 获取K线数据请求接口
     * @param ctx
     */
    public void getKline() {
        String stockCode = "601398";
        long timeStart = 1l;
        long timeEnd = System.currentTimeMillis();
        System.out.println("******* Send getKline, Parameters *******");
        System.out.println("== stockCode : " + stockCode );
        System.out.println("== timeStart: " + timeStart);
        System.out.println("== timeEnd: " + timeEnd);

        // 构造头部信息
        StockHeadProto.StockHead stockHead = StockHeadProto.StockHead.newBuilder().setSeqId(seqId ++ ).setRequestType(StockHeadProto.RequestType.QUOTE_KLINE).build();
        // 构造获取K线请求接口的数据包
        KlineData klineData = KlineData.newBuilder().setStockCode(stockCode).setTimeStart(timeStart).setTimeEnd(timeEnd).build();
        // 组装请求数据包
        StockMessage stockMessage = StockMessage.newBuilder().setStockHead(stockHead).setKlineData(klineData).build();
        // 发送消息至服务端
        sendMsg(stockMessage);
    }

    /**
     * 撤单接口
     * @param ctx
     */
    public void recallOrder(String orderIdStr) {

        Long orderId = Long.valueOf(orderIdStr);
        System.out.println("****** Send Recall Order, Parameters ****** ");
        System.out.println("== orderId: " + orderId);

        // 构造头部信息
        StockHeadProto.StockHead stockHead = StockHeadProto.StockHead.newBuilder()
                .setSeqId(seqId ++).setRequestType(StockHeadProto.RequestType.RECALL_ORDER).build();

        RecallOrderData recallOrderData = RecallOrderData.newBuilder().setOrderId(orderId).setStockId(1).build();

        // 组装请求信息
        StockMessage stockMessage = StockMessage.newBuilder().setStockHead(stockHead).setRecallOrderData(recallOrderData).build();

        // 发送消息至服务端
        sendMsg(stockMessage);
    }

    /**
     * 获取订单详情
     * @param ctx
     */
    public void getOrder(String order) {

        long orderId = Long.valueOf(order);

        System.out.println("****** Send Get Order, Parameters ****** ");
        System.out.println("== orderId: " + orderId);

        // 构造头部信息
        StockHeadProto.StockHead stockHead = StockHeadProto.StockHead.newBuilder().setSeqId(seqId ++).setRequestType(StockHeadProto.RequestType.GET_ORDER).build();

        GetOrderData getOrderData = GetOrderData.newBuilder().setOrderId(orderId).build();

        // 组装请求信息
        StockMessage stockMessage = StockMessage.newBuilder().setStockHead(stockHead).setGetOrderData(getOrderData).build();

        // 发送消息至服务端
        sendMsg(stockMessage);

    }

    /**
     * 获取所有持仓数据
     * @param ctx
     */
    public void getAllPositions() {

        System.out.println("****** Send Get Positions ****** ");

        // 构造头部信息
        StockHeadProto.StockHead stockHead = StockHeadProto.StockHead.newBuilder().setSeqId(seqId ++).setRequestType(StockHeadProto.RequestType.GET_ALL_POSITIONS).build();

        // 组装请求信息
        StockMessage stockMessage = StockMessage.newBuilder().setStockHead(stockHead).build();

        // 发送消息至服务端
        sendMsg(stockMessage);

    }

    /**
     * 获取账户资金总览信息
     * @param ctx
     */
    public void getAccountFinanceSummary() {

        System.out.println("****** Send Get Account Finance Summary ****** ");

        // 构造头部信息
        StockHeadProto.StockHead stockHead = StockHeadProto.StockHead.newBuilder().setSeqId(seqId ++).setRequestType(StockHeadProto.RequestType.GET_FINANCE_OVERVIEW).build();

        // 组装请求信息
        StockMessage stockMessage = StockMessage.newBuilder().setStockHead(stockHead).build();

        // 发送消息至服务端
        sendMsg(stockMessage);
    }


    /**
     *  获取账户的交割单信息
     * @param ctx
     */
    public void getAccountSettlements() {

        String timeStart = "2020-05-28 00:00:00";
        String timeEnd = "2020-05-28 23:59:59";
        System.out.println("****** Send Get Account Settlements, Parameters ****** ");
        System.out.println("== timeStart: " + timeStart + ", " + DateUtils.parse2TimeSeconds(timeStart));
        System.out.println("== timeEnd: " + timeEnd + ", " + DateUtils.parse2TimeSeconds(timeEnd));
        // 构造头部信息
        StockHeadProto.StockHead stockHead = StockHeadProto.StockHead.newBuilder()
                .setSeqId(seqId ++).setRequestType(StockHeadProto.RequestType.GET_ACCOUNT_SETTLEMENTS).build();

        GetAccountSettlementData settlementData = GetAccountSettlementData.newBuilder()
                .setTimeStart(DateUtils.parse2TimeSeconds(timeStart))
                .setTimeEnd(DateUtils.parse2TimeSeconds(timeEnd)).build();

        // 组装请求信息
        StockMessage stockMessage = StockMessage.newBuilder().setStockHead(stockHead).setGetAccountSettlementData(settlementData).build();

        // 发送消息至服务端
        sendMsg(stockMessage);

    }
}
