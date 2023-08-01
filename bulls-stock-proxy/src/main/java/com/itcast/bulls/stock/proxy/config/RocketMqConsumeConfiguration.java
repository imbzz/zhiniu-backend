package com.itcast.bulls.stock.proxy.config;

import com.querydsl.core.annotations.Config;
import org.springframework.cloud.stream.annotation.EnableBinding;
import org.springframework.cloud.stream.annotation.Input;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.SubscribableChannel;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@Configuration
@EnableBinding({RocketMqConsumeConfiguration.QueueSource.class})
public class RocketMqConsumeConfiguration {

    public interface QueueSource {
        @Input("quote")
        SubscribableChannel quote();
    }
}
