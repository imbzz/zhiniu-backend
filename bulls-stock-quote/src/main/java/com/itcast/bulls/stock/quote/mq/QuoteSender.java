package com.itcast.bulls.stock.quote.mq;

import com.itcast.bulls.stock.quote.config.RocketMqProduceConfiguration;
import org.apache.rocketmq.common.message.MessageConst;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.Message;
import org.springframework.messaging.MessageHeaders;
import org.springframework.messaging.support.MessageBuilder;
import org.springframework.stereotype.Service;
import org.springframework.util.MimeTypeUtils;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@Service
public class QuoteSender {

    @Autowired
    private RocketMqProduceConfiguration.QueueSource source;

    /**
     * 发送对象消息, 附带TAG标记信息
     * @param msg
     * @param tag
     * @param <T>
     * @throws Exception
     */
    public <T> void sendObject(T msg, String tag) throws Exception {
        Message message = MessageBuilder.withPayload(msg)
                .setHeader(MessageConst.PROPERTY_TAGS, tag)
                .setHeader(MessageHeaders.CONTENT_TYPE, MimeTypeUtils.APPLICATION_JSON)
                .build();
        source.quoteQueue().send(message);
    }

    /**
     * 直接发送对象消息
     * @param msg
     * @param <T>
     * @throws Exception
     */
    public <T> void sendObject(T msg) throws Exception {
        Message message = MessageBuilder.withPayload(msg)
                .setHeader(MessageHeaders.CONTENT_TYPE, MimeTypeUtils.APPLICATION_JSON)
                .build();
        source.quoteQueue().send(message);
    }
}
