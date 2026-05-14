package org.zaohu.config.scheduled;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.TaskScheduler;
import org.springframework.scheduling.concurrent.ConcurrentTaskScheduler;

import java.util.concurrent.Executors;

@Configuration
public class SchedulerConfig {

    @Bean
    public TaskScheduler taskScheduler() {
        // 1. 创建一个使用虚拟线程的执行器
        var virtualThreadsExecutor = Executors.newThreadPerTaskExecutor(
                Thread.ofVirtual().name("scheduled-vt-", 0).factory()
        );
        // 2. 创建一个标准的调度器
        var scheduledExecutor = Executors.newScheduledThreadPool(1);
        // 3. 组装：调度器触发，执行器执行
        return new ConcurrentTaskScheduler(virtualThreadsExecutor, scheduledExecutor);
    }
}