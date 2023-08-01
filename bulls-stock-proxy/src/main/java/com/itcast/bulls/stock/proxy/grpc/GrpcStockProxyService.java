package com.itcast.bulls.stock.proxy.grpc;

import com.itcast.bull.stock.common.service.utils.BeanAssistant;
import com.itcast.bulls.stock.common.utils.GlobalConstants;
import com.itcast.bulls.stock.proxy.netty.StockProxyServerHandler;
import com.itcast.bulls.stock.struct.netty.trade.ResponseMessage;
import com.itcast.bulls.stock.struct.netty.trade.StockHeadProto;
import com.itcast.bulls.stock.struct.netty.trade.WarnMessageDataResp;
import com.itcast.trade.stock.struct.grpc.trade.StockProxyServiceGrpc;
import com.itcast.trade.stock.struct.grpc.trade.WarnMessageData;
import com.itcast.trade.stock.struct.grpc.trade.WarnMessageDataRequest;
import com.itcast.trade.stock.struct.grpc.trade.WarnMessageResponse;
import io.grpc.stub.StreamObserver;
import io.netty.channel.Channel;
import io.netty.channel.ChannelId;
import lombok.extern.log4j.Log4j2;
import net.devh.boot.grpc.server.service.GrpcService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@GrpcService
@Log4j2
public class GrpcStockProxyService extends StockProxyServiceGrpc.StockProxyServiceImplBase {


    @Autowired
    private CacheManager cacheManager;

    private static Long warnMessageSeqId = 1l;

    /**
     * <pre>
     * 发送预警通知消息
     * </pre>
     */
    @Override
    public void notifyWarnMessage(WarnMessageDataRequest request,
                                  StreamObserver<WarnMessageResponse> responseObserver) {

        WarnMessageResponse reponse = null;
        try {

            WarnMessageResponse.Builder reponseBuilder = WarnMessageResponse.newBuilder();
            // 1. 判断发送端传递的参数有无预警通知数据
            if(request.getWarnMessageDataListCount() > 0) {

                // 2. 根据账户ID， 分组汇总数据
                Map<Long, List<WarnMessageData>> accNotifyMessages = request.getWarnMessageDataListList().stream().collect(
                        Collectors.groupingBy(WarnMessageData::getAccountId));

                Cache cache = cacheManager.getCache(GlobalConstants.STOCK_PROXY_USER_KEY);

                // 3. 组装推送给客户端的头部消息
                StockHeadProto.StockHead stockHead = StockHeadProto.StockHead.newBuilder()
                        .setRequestType(StockHeadProto.RequestType.NOTIFY_WARN_MESSAGE)
                        .setSeqId(warnMessageSeqId++).setStatus(GlobalConstants.STATUS_OK).build();

                // 4. 获取当前在线用户缓存
                Cache.ValueWrapper onlineWrapper = cache.get(GlobalConstants.STOCK_PROXY_USER_KEY_ONLINE);
                if(null != onlineWrapper) {
                    Map<Long, ChannelId> accountInfos = (Map<Long, ChannelId>) onlineWrapper.get();
                    // 6. 遍历通知消息， 发送处理
                    accNotifyMessages.forEach((accountId, messageDataList )-> {
                        ChannelId channelId = accountInfos.get(accountId);
                        Channel channel = StockProxyServerHandler.channels.find(channelId);
                        // 7. 判断在线用户的连接通道是否存在
                        if(null != channel) {
                            WarnMessageDataResp.Builder messageDataResp = WarnMessageDataResp.newBuilder();
                            // 8. 遍历每个账户的预警通知消息， 进行转换处理, 支持批量发送
                            messageDataList.forEach(messageData -> {
                                com.itcast.bulls.stock.struct.netty.trade.WarnMessageData .Builder dataBuilder = com.itcast.bulls.stock.struct.netty.trade.WarnMessageData .newBuilder();
                                BeanAssistant.copyNotNullProps(messageData, dataBuilder);
                                messageDataResp.addWarnMessageDataList(dataBuilder);
                                // 记录发送的消息ID
                                reponseBuilder.addIds(messageData.getId());

                            });
                            // 9. 组装返回推送给客户端的消息
                            ResponseMessage responseMessage = ResponseMessage.newBuilder()
                                    .setStockHead(stockHead)
                                    .setWarnMessageDataResp(messageDataResp).build();
                            // 10. 通过channel通道， 将消息发送至客户端
                            channel.writeAndFlush(responseMessage);
                        }

                    });
                }

            }
            reponse = reponseBuilder.build();
        }
        catch (Exception e) {
            // 系统异常信息返回
            log.error(e.getMessage(), e);
            reponse = WarnMessageResponse.newBuilder().setStatus(GlobalConstants.STATUS_ERROR).setMessage(e.getMessage()).build();
        }

        responseObserver.onNext(reponse);
        responseObserver.onCompleted();

    }

}