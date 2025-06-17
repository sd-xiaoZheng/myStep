package org.zaohu.example.rocketMQ.consumer;

import org.apache.rocketmq.client.consumer.DefaultMQPushConsumer;
import org.apache.rocketmq.client.consumer.listener.ConsumeConcurrentlyContext;
import org.apache.rocketmq.client.consumer.listener.ConsumeConcurrentlyStatus;
import org.apache.rocketmq.client.consumer.listener.MessageListenerConcurrently;
import org.apache.rocketmq.client.exception.MQClientException;
import org.apache.rocketmq.common.message.MessageExt;

import java.util.List;

/**
 * 过滤消息消费者-Tag方式
 * @author Zaohu
 * @since 2024/11/30
 **/
public class FilterTagConsumer {
    public static void main(String[] args) throws MQClientException {
//push推模式 被动获取消息
        DefaultMQPushConsumer defaultMQPushConsumer = new DefaultMQPushConsumer("Example_Consumer");
        defaultMQPushConsumer.setNamesrvAddr("127.0.0.1:9876");
//        defaultMQPushConsumer.subscribe("Filter","TagA");
        defaultMQPushConsumer.subscribe("Filter","TagA || TagB");//从Filter的borker 只获取TagA的消息
        defaultMQPushConsumer.setMessageListener(new MessageListenerConcurrently() {//new的是并发消费 所以无序
            @Override
            public ConsumeConcurrentlyStatus consumeMessage(List<MessageExt> list, ConsumeConcurrentlyContext consumeConcurrentlyContext) {
                for (int i = 0; i < list.size(); i++) {
                    System.out.println("消息消费成功"+ new String(list.get(i).getBody()));
                }
                return ConsumeConcurrentlyStatus.CONSUME_SUCCESS;
            }
        });//消费方式
        defaultMQPushConsumer.start();
        System.out.println("Consumer Started.");
    }
}
