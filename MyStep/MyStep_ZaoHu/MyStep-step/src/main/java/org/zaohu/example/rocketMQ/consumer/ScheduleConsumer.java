package org.zaohu.example.rocketMQ.consumer;

import org.apache.rocketmq.client.consumer.DefaultMQPushConsumer;
import org.apache.rocketmq.client.consumer.listener.ConsumeConcurrentlyContext;
import org.apache.rocketmq.client.consumer.listener.ConsumeConcurrentlyStatus;
import org.apache.rocketmq.client.consumer.listener.MessageListenerConcurrently;
import org.apache.rocketmq.client.exception.MQClientException;
import org.apache.rocketmq.common.message.MessageExt;

import java.time.LocalTime;
import java.util.List;

/**
 * 预定日程消费者 延迟消息消费者
 * {@code @Author}  Zaohu
 * {@code @CreateTime}  2024/11/28
 **/
public class ScheduleConsumer {
    public static void main(String[] args) throws MQClientException {
        //push推模式 被动获取消息
        DefaultMQPushConsumer defaultMQPushConsumer = new DefaultMQPushConsumer("ScheduleProducer");
        defaultMQPushConsumer.setNamesrvAddr("127.0.0.1:9876");
        defaultMQPushConsumer.subscribe("Schedule", "*");//从哪个地方获取消息  第二个参数标识过滤：*标识不过滤 接受所有
        defaultMQPushConsumer.setMessageListener(new MessageListenerConcurrently() {//new的是并发消费 所以无序
            @Override
            public ConsumeConcurrentlyStatus consumeMessage(List<MessageExt> list, ConsumeConcurrentlyContext consumeConcurrentlyContext) {
                for (int i = 0; i < list.size(); i++) {
                    System.out.println("消息消费成功" + LocalTime.now());
                }
                return ConsumeConcurrentlyStatus.CONSUME_SUCCESS;
            }
        });//消费方式
        defaultMQPushConsumer.start();
        System.out.println("Schedule Consumer Started.");
    }
}
