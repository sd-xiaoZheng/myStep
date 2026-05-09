package org.zaohu.zaohugateway.Utils.threadUtils;

import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class ThreadPoolUtils {

    /**
     * 虚拟线程执行器 (JEP 444)
     */
    private static final ExecutorService THREAD_POOL_EXECUTOR = Executors.newVirtualThreadPerTaskExecutor();

    /**
     * 声明式定义线程池工具类对象静态变量，在所有线程中同步
     */
    private static volatile ThreadPoolUtils threadPoolUtils = null;

    /**
     * 线程池工具类空参构造方法
     */
    private ThreadPoolUtils() {}

    /**
     * 获取线程池工具类实例
     */
    public static ThreadPoolUtils getNewInstance(){
        if (threadPoolUtils == null) {
            synchronized (ThreadPoolUtils.class) {
                if (threadPoolUtils == null) {
                    threadPoolUtils = new ThreadPoolUtils();
                }
            }
        }
        return threadPoolUtils;
    }

    /**
     * 执行线程任务
     * @param runnable 任务线程
     */
    public void executor(Runnable runnable) {
        THREAD_POOL_EXECUTOR.execute(runnable);
    }

    /**
     * 获取线程池状态
     * @return 返回线程池状态
     */
    public boolean isShutDown(){
        return THREAD_POOL_EXECUTOR.isShutdown();
    }

    /**
     * 停止正在执行的线程任务
     * @return 返回等待执行的任务列表
     */
    public List<Runnable> shutDownNow(){
        return THREAD_POOL_EXECUTOR.shutdownNow();
    }

    /**
     * 关闭线程池
     */
    public void showDown(){
        THREAD_POOL_EXECUTOR.shutdown();
    }

    /**
     * 关闭线程池后判断所有任务是否都已完成
     */
    public boolean isTerminated(){
        return THREAD_POOL_EXECUTOR.isTerminated();
    }
}
