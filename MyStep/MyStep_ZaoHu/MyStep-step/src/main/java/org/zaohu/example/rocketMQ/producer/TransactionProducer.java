package org.zaohu.example.rocketMQ.producer;

import org.apache.rocketmq.client.exception.MQClientException;
import org.apache.rocketmq.client.producer.TransactionMQProducer;
import org.apache.rocketmq.client.producer.TransactionSendResult;
import org.apache.rocketmq.common.message.Message;
import org.zaohu.example.rocketMQ.impl.TransactionListenerImpl;

import java.nio.charset.StandardCharsets;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * 事务消息生产着
 *
 * @author Zaohu
 * @since 2024/11/30
 **/
public class TransactionProducer {
    public static void main(String[] args) throws MQClientException, InterruptedException {
        TransactionMQProducer transactionProducer = new TransactionMQProducer("TransactionProducer");
        transactionProducer.setNamesrvAddr("127.0.0.1:9876");

        //用异步提交事务状态 提高系统的性能和可靠性
        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(
                2,
                5,
                100,
                TimeUnit.SECONDS,
                new ArrayBlockingQueue<>(2000), new ThreadFactory() {
            @Override
            public Thread newThread(Runnable r) {
                Thread thread = new Thread(r);
                thread.setName("ExecutorService-ZaoHu");
                return thread;
            }
        });
        transactionProducer.setExecutorService(threadPoolExecutor);//用异步提交事务状态
        transactionProducer.setTransactionListener(new TransactionListenerImpl());//本地事务监听器
        transactionProducer.start();
        String[] tags = {"TagA", "TagB", "TagC", "TagD", "TagE"};
        for (int i = 0; i < 10; i++) {
            Message message = new Message("Transaction",
                    tags[i % tags.length],
                    (tags[i % tags.length] + "_TransactionProducer").getBytes(StandardCharsets.UTF_8));
            TransactionSendResult transactionSendResult = transactionProducer.sendMessageInTransaction(message, null);
            System.out.println("消息发送成功：" + transactionSendResult);
            Thread.sleep(10);
        }
        Thread.sleep(1000000);
        transactionProducer.shutdown();
    }
}
