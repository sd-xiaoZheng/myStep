package org.zaohu.example.rocketMQ.producer;


import org.apache.rocketmq.client.exception.MQBrokerException;
import org.apache.rocketmq.client.exception.MQClientException;
import org.apache.rocketmq.client.producer.DefaultMQProducer;
import org.apache.rocketmq.client.producer.SendCallback;
import org.apache.rocketmq.client.producer.SendResult;
import org.apache.rocketmq.common.message.Message;
import org.apache.rocketmq.remoting.exception.RemotingException;

import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

/**
 * 异步发送 不等待消费者返回直接推给broker进行下一步,性能比同步发送要高
 */
public class AsyncProducer {
    public static void main(String[] args) throws MQClientException, MQBrokerException, RemotingException, InterruptedException {
        DefaultMQProducer AsyncProducer = new DefaultMQProducer("ASyncProducer");
        AsyncProducer.setNamesrvAddr("127.0.0.1:9876");
        AsyncProducer.start();

        //计数器用法：
        //创建CountDownLatch并设置计数器值。
        //启动多线程并且调用CountDownLatch实例的countDown()方法。
        //主线程调用 await() 方法，这样主线程的操作就会在这个方法上阻塞，直到其他线程完成各自的任务，count值为0，停止阻塞，主线程继续执行。
        CountDownLatch countDownLatch = new CountDownLatch(100);//计数器

        for (int i = 0; i < 100; i++) {
            Message message = new Message("Example", "TagA", (i + "ASyncProducer").getBytes(StandardCharsets.UTF_8));
            final int finalI = i;
            AsyncProducer.send(message, new SendCallback() {//指定第二个参数SendCallback后，表示是异步发送
                @Override
                public void onSuccess(SendResult sendResult) {
                    //发送成功调用此处
                    System.out.println(finalI +"_消息发送成功"+sendResult);
                    countDownLatch.countDown();
                }

                @Override
                public void onException(Throwable throwable) {
                    //发送异常调用此处
                    System.out.println(finalI+"_消息发送失败"+ Arrays.toString(throwable.getStackTrace()));
                    countDownLatch.countDown();
                }
            });
        }
        countDownLatch.await(5, TimeUnit.SECONDS);

        AsyncProducer.shutdown();
    }
}
