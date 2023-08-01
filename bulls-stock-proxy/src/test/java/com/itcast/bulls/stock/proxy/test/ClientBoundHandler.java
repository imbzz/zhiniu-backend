package com.itcast.bulls.stock.proxy.test;

import com.itcast.bulls.stock.struct.netty.trade.ResponseMessage;
import com.itcast.bulls.stock.struct.netty.trade.StockHeadProto;
import io.netty.buffer.ByteBuf;
import io.netty.buffer.ByteBufUtil;
import io.netty.channel.*;
import io.netty.handler.codec.http.FullHttpResponse;
import io.netty.handler.codec.http.websocketx.*;
import io.netty.util.CharsetUtil;
import lombok.extern.log4j.Log4j2;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@Log4j2
public class ClientBoundHandler extends SimpleChannelInboundHandler<Object> {
    /**
     * 定义请求类型， 用来记录需要发送的预置消息（连接建立后即发送）
     */
    private StockHeadProto.RequestType method;


    /**
     * 业务接口处理器
     */
    private BusinessHandler businessHandler;

    /**
     * WebSocket握手配置信息
     */
    private WebSocketClientHandshaker handshaker;

    /**
     * WebSocket 握手消息的响应配置通道
     */
    private ChannelPromise handshakeFuture;

    @Override
    public void handlerAdded(ChannelHandlerContext ctx) throws Exception {
        this.handshakeFuture = ctx.newPromise();
    }

    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {
        ctx.close();
        log.error("出现异常: ", cause);
    }

    @Override
    public void channelActive(ChannelHandlerContext ctx) throws Exception {
        System.out.println("********** Server Connected **********");
        // 创建业务处理器
        businessHandler = new BusinessHandler(ctx.channel());
        // 调用预置方法
        prevInvokeMethod();

        // 处理接收用户发送的指令
        StringBuffer recv = new StringBuffer();

        new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    // 显示模拟客户端的功能菜单
                    showMenu();
                    while(!"0".equalsIgnoreCase(recv.toString()) && !"exit".equalsIgnoreCase(recv.toString())){
                        String command = readInput(recv);
                        if("1".equals(command)) {
                            // 用户登录接口
                            businessHandler.userLogin();
                        }else if("2".equals(command)){
                            // 用户下单接口
                            businessHandler.placeOrder();
                        }else if("3".equals(command)) {
                            // 获取K线数据接口
                            businessHandler.getKline();
                        }else if("4".equals(command)) {
                            // 用户撤单接口
                            System.out.println("Enter OrderId: ");
                            String order = readInput(recv);
                            businessHandler.recallOrder(order);
                        }else if("5".equals(command)) {
                            // 查询订单详情
                            System.out.println("Enter OrderId: ");
                            String order = readInput(recv);
                            businessHandler.getOrder(order);
                        }else if("6".equals(command)) {
                            // 查询用户持仓数据
                            businessHandler.getAllPositions();
                        }else if("7".equals(command)) {
                            // 获取账户资金总览信息
                            businessHandler.getAccountFinanceSummary();
                        }else if("8".equals(command)) {
                            // 获取账户交割单数据
                            businessHandler.getAccountSettlements();
                        }else if("9".equals(command))  {
                            businessHandler.accountWarnSetting();
                        }else if("m".equalsIgnoreCase(command)) {
                            showMenu();
                        }else {
                            System.out.println("Unrecognized Command!");
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }).start();
    }

    /**
     * 读取用户输入的字符串
     * @param recv
     * @return
     */
    private String readInput(StringBuffer recv) {
        try {
            recv.setLength(0);
            int in = System.in.read();
            // 读取用户输入的字符串信息, 直至用户输入回车符
            while(in != -1 && in != '\n'){
                recv.append((char)in);
                in = System.in.read();
            }
            return recv.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 预置调用方法的处理
     */
    private void prevInvokeMethod() {
        if(null != method) {
            try {
                // TODO 预置方法的调用处理
//                businessHandler.placeOrder();
            }catch (Exception e) {
                e.printStackTrace();
            }
        }

    }

    /**
     * 显示主菜单(列出所有的交互指令)
     */
    private void showMenu() {
        System.out.println("Please Enter Command: ");
        System.out.println("1: User Login 【用户登录】");
        System.out.println("2: Place Order 【用户下单】");
        System.out.println("3: Get Kline Data【获取K线数据】");
        System.out.println("4: Recall Order【用户撤单】");
        System.out.println("5: Get Order【查询订单详情】");
        System.out.println("6: Get Positions【查询用户持仓数据】");
        System.out.println("7: Get Finance Summary【获取账户资金总览信息】");
        System.out.println("8: Get Account Settlements【获取账户交割单数据】");
        System.out.println("9: Account Warn Settings【账户预警通知设置】");
        System.out.println("M: 返回主界面【退出】");
        System.out.println("0: Exit 【退出客户端】");
    }

    /**
     * 客户端数据接收的处理方法
     * @param channelHandlerContext
     * @param o
     * @throws Exception
     */
    @Override
    protected void channelRead0(ChannelHandlerContext ctx, Object msg) throws Exception {
        Channel ch = ctx.channel();
        FullHttpResponse response;
        if(!this.handshaker.isHandshakeComplete()) {
            try {
                response = (FullHttpResponse)msg;
                // 握手协议返回, 完成握手处理
                this.handshaker.finishHandshake(ch, response);
                // 标记握手响应成功
                this.handshakeFuture.setSuccess();
            } catch (WebSocketHandshakeException e) {
                FullHttpResponse res = (FullHttpResponse) msg;
                String errorMsg = String.format("WebSocket Client failed to connect, status: %s", res.status(), res.content().toString(CharsetUtil.UTF_8));
                this.handshakeFuture.setFailure(new Exception(errorMsg));
            }
        }else if( msg instanceof  FullHttpResponse) {
            //接收到http响应消息(未完成握手)
            response = (FullHttpResponse)msg;
            throw new IllegalStateException(String.format("Unexpected FullHttpResponse, status:%s, reason:%s ", response.getStatus(), response.content().toString(CharsetUtil.UTF_8)));
        }else {
            WebSocketFrame frame = (WebSocketFrame)msg;
            if(frame instanceof TextWebSocketFrame) {
                TextWebSocketFrame textFrame = (TextWebSocketFrame)frame;
                System.out.println("receive TextWebSocketFrame");
            }else if(frame instanceof BinaryWebSocketFrame) {
                BinaryWebSocketFrame binaryWebSocketFrame = (BinaryWebSocketFrame)frame;
                ByteBuf byteBuf = frame.content();
                byte[] array = ByteBufUtil.getBytes(byteBuf, byteBuf.readerIndex(), byteBuf.readableBytes(), false);
                recvProtoMsg(ResponseMessage.parseFrom(array));
                System.out.println("receive BinaryWebSocketFrame");
            }else if(frame instanceof PongWebSocketFrame) {
                System.out.println("receive PongWebSocketFrame");
            }else if(frame instanceof CloseWebSocketFrame) {
                System.out.println("receive CloseWebSocketFrame");
                ch.close();
            }
        }
    }

    /**
     * 接收服务端发送的Protobuf业务消息, 将业务消息打印出来
     * @param parseFrom
     */
    private void recvProtoMsg(ResponseMessage msg) {
        StockHeadProto.StockHead stockHead = msg.getStockHead();
        System.out.println("******** Receive Server Message ********");
        System.out.println("== seqId: " + stockHead.getSeqId());
        System.out.println("== requestType: " + stockHead.getRequestType());
        System.out.println("== status: " + stockHead.getStatus());
        System.out.println("== message: " + msg.getMessage());
        if(stockHead.getRequestType() == StockHeadProto.RequestType.PLACE_ORDER) {
            System.out.println(" == order id: " + msg.getPlaceOrderResp().getDealId());
        }else if(stockHead.getRequestType() == StockHeadProto.RequestType.QUOTE_REALTIME) {
            System.out.println(" == 实时行情 【" + msg.getQuoteRealtimeResp().getStockName() + "】");
            System.out.println(msg.getQuoteRealtimeResp().toString());
        }else if(stockHead.getRequestType() == StockHeadProto.RequestType.QUOTE_KLINE) {
            System.out.println(" == 获取K线数据");
            System.out.println(" == data size: " + msg.getKlineDataRespLists().getKlineDataRespCount());
            System.out.println(" == data List: " + msg.getKlineDataRespLists());
        }else if(stockHead.getRequestType() == StockHeadProto.RequestType.GET_ORDER) {
            if(null != msg.getGetOrderResp() && msg.getGetOrderResp().getId() > 0) {
                System.out.println("== order detail data: ");
                System.out.println(msg.getGetOrderResp());
            }
        }else if(stockHead.getRequestType() == StockHeadProto.RequestType.GET_ALL_POSITIONS) {
            System.out.println("== data size : " + msg.getGetAllPositionList().getGetAllPositionDataCount());
            System.out.println("== data list: " + msg.getGetAllPositionList());
        }else if(stockHead.getRequestType() == StockHeadProto.RequestType.GET_FINANCE_OVERVIEW) {
            System.out.println("== data : " + msg.getGetFinanceOverviewResp());
        }else if(stockHead.getRequestType() == StockHeadProto.RequestType.GET_ACCOUNT_SETTLEMENTS) {
            System.out.println("== data size: " + msg.getGetAccountSettlementRespDataList().getGetAccountSettlementRespDataCount());
            System.out.println("== data list: " + msg.getGetAccountSettlementRespDataList());
        }else if(stockHead.getRequestType() == StockHeadProto.RequestType.NOTIFY_WARN_MESSAGE) {
            // 增加预警通知记录打印
            System.out.println("data size: " + msg.getWarnMessageDataResp().getWarnMessageDataListCount());
            if(msg.getWarnMessageDataResp().getWarnMessageDataListCount() > 0) {
                msg.getWarnMessageDataResp().getWarnMessageDataListList().forEach(warnData -> {
                    System.out.println("warn message: " + warnData.getNotifyContent());
                });
            }

        }
    }

    public ClientBoundHandler(StockHeadProto.RequestType method) {
        this.method = method;
    }
    public void setHandshaker(WebSocketClientHandshaker handshaker) {
        this.handshaker = handshaker;
    }

    public ChannelFuture handshakeFuture() {
        return this.handshakeFuture;
    }

    public BusinessHandler getBusinessHandler() {
        return businessHandler;
    }
}
