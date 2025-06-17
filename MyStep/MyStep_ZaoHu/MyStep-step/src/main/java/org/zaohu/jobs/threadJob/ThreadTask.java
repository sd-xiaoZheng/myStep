package org.zaohu.jobs.threadJob;

import lombok.RequiredArgsConstructor;

/**
 * @Author ScholarTang
 * @Date 2021/11/3 下午2:14
 * @Desc 任务线程
 */
@RequiredArgsConstructor
public class ThreadTask implements Runnable{
    @Override
    public void run() {
        System.out.println("测试任务");
    }
}