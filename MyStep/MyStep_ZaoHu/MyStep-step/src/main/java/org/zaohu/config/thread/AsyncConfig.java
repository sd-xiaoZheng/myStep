package org.zaohu.config.thread;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

import java.util.concurrent.Executor;
import java.util.concurrent.ThreadPoolExecutor;

/**
 * @author myStep
 * @since 2025/11/4
 **/

@Configuration
@EnableAsync
public class AsyncConfig {
    @Bean(name = "asyncTaskExecutor") // 线程池Bean名称，后续可指定使用
    public Executor asyncTaskExecutor() {
        ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();

        // 核心线程数（默认活跃的线程数）
        executor.setCorePoolSize(5);
        // 最大线程数（线程池能容纳的最大线程数）
        executor.setMaxPoolSize(100);
        // 队列容量（核心线程满后，任务放入队列等待）
        executor.setQueueCapacity(300);
        // 空闲线程存活时间（超过核心线程数的线程，空闲多久后销毁）
        executor.setKeepAliveSeconds(60);
        // 线程名称前缀（便于日志排查）
        executor.setThreadNamePrefix("Async-Step-");
        // 拒绝策略（队列满+最大线程数满时，如何处理新任务）
        // ThreadPoolExecutor.CallerRunsPolicy：由调用线程（主线程）执行，避免任务丢失
        executor.setRejectedExecutionHandler(new ThreadPoolExecutor.CallerRunsPolicy());
        // 初始化线程池
        executor.initialize();
        return executor;
    }
}
