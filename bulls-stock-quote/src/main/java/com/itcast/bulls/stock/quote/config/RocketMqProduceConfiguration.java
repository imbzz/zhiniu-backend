package com.itcast.bulls.stock.quote.config;

import org.springframework.cloud.stream.annotation.EnableBinding;
import org.springframework.cloud.stream.annotation.Output;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.MessageChannel;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@Configuration
@EnableBinding({RocketMqProduceConfiguration.QueueSource.class})
public class RocketMqProduceConfiguration {

    public interface QueueSource {
        @Output("quote")
        MessageChannel quoteQueue();
    }
}
