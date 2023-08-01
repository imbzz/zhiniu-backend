package com.itcast.bulls.stock.pending.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

import java.util.concurrent.Executor;
import java.util.concurrent.ThreadPoolExecutor;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@Configuration
@EnableAsync
public class TaskExecutorConfiguration {

    /**
     * 核心线程数量
     */
    @Value("${task.executor.corePoolSize:5 }")
    private int corePoolSize;

    /**
     * 最大线程数量
     */
    @Value("${task.executor.maxPoolSize:10 }")
    private int maxPoolSize;

    /**
     * 任务队列的吞吐数量
     */
    @Value("${task.executor.queueCapacity:500 }")
    private int queueCapacity;

    /**
     * 线程有效存活时间
     */
    @Value("${task.executor.keepAliveSeconds:60 }")
    private int keepAliveSeconds;

    @Bean
    public Executor taskExecutor() {
        ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
        executor.setCorePoolSize(corePoolSize);
        executor.setMaxPoolSize(maxPoolSize);
        executor.setQueueCapacity(queueCapacity);
        executor.setKeepAliveSeconds(keepAliveSeconds);
        executor.setThreadNamePrefix("PendingAsyncTaskExec-");
        // 线程队列塞满的情况下, 该任务会在调用者的线程(主线程)当中继续执行, 任务并不会被抛弃
        executor.setRejectedExecutionHandler(new ThreadPoolExecutor.CallerRunsPolicy());
        return executor;
    }

}
