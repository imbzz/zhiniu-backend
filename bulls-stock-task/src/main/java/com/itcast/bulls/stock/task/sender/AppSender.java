package com.itcast.bulls.stock.task.sender;

import com.itcast.bull.stock.common.service.utils.BeanAssistant;
import com.itcast.bulls.stock.common.utils.GlobalConstants;
import com.itcast.bulls.stock.starter.sender.base.IWarnNotifySender;
import com.itcast.bulls.stock.starter.sender.vo.SenderMessage;
import com.itcast.bulls.stock.starter.sender.vo.SenderResult;
import com.itcast.trade.stock.struct.grpc.trade.StockProxyServiceGrpc;
import com.itcast.trade.stock.struct.grpc.trade.WarnMessageData;
import com.itcast.trade.stock.struct.grpc.trade.WarnMessageDataRequest;
import com.itcast.trade.stock.struct.grpc.trade.WarnMessageResponse;
import lombok.extern.log4j.Log4j2;
import net.devh.boot.grpc.client.inject.GrpcClient;
import org.springframework.scheduling.annotation.Async;
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
public class AppSender implements IWarnNotifySender {

    @GrpcClient("grpc-proxy-server")
    private StockProxyServiceGrpc.StockProxyServiceBlockingStub stockProxyServiceBlockingStub;

    /**
     * 发送预警通知
     * @param receiver
     * @param subject
     * @param content
     * @return
     */
    @Override
    @Async
    public SenderResult sendMessage(SenderMessage senderMessage) {

        SenderResult result = new SenderResult();
        result.setId(senderMessage.getId());
        try {
            // 构造预警通知消息请求包
            WarnMessageDataRequest.Builder warnMessageBuilder = WarnMessageDataRequest.newBuilder();
            WarnMessageData.Builder warnMessageDataBuilder = WarnMessageData.newBuilder();
            BeanAssistant.copyNotNullProps(senderMessage, warnMessageDataBuilder);
            warnMessageBuilder.addWarnMessageDataList(warnMessageDataBuilder);

            // 发送预警通知消息
            WarnMessageResponse warnMessageResponse = stockProxyServiceBlockingStub.notifyWarnMessage(warnMessageBuilder.build());
            if(null != warnMessageResponse && warnMessageResponse.getIdsCount() > 0) {
                for (Long id : warnMessageResponse.getIdsList()) {
                    if(id.equals(senderMessage.getId())){
                        // 记录发送结果
                        result.setSendStatus(GlobalConstants.STATUS_OK);
                    }
                }
            }

        }catch (Exception e) {
            // 系统异常返回
            log.error(e.getMessage(), e);
        }

        return result;
    }

    /**
     * 同步方式发送消息
     * @param senderMessage
     * @return
     */
    @Override
    public SenderResult sendSyncMessage(SenderMessage senderMessage) {

        return sendMessage(senderMessage);
    }

}
