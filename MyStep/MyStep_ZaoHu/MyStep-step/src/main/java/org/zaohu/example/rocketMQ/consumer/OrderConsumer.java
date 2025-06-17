package org.zaohu.example.rocketMQ.consumer;

import org.apache.rocketmq.client.consumer.DefaultMQPushConsumer;
import org.apache.rocketmq.client.consumer.listener.*;
import org.apache.rocketmq.client.exception.MQClientException;
import org.apache.rocketmq.common.message.MessageExt;

import java.util.List;

/**
 * 顺序消息的消费者
 * @ Author Zaohu
 * @ CreateTime 2024/11/28
 **/
public class OrderConsumer {
    public static void main(String[] args) throws MQClientException {

        //push推模式 被动获取消息
        DefaultMQPushConsumer defaultMQPushConsumer = new DefaultMQPushConsumer("Example_Consumer");
        defaultMQPushConsumer.setNamesrvAddr("127.0.0.1:9876");
        defaultMQPushConsumer.subscribe("Order", "*");//从哪个地方获取消息  第二个参数标识过滤：*标识不过滤 接受所有

        //这里是设置MessageListenerOrderly 顺序消费 作用每个queue中的顺序
        defaultMQPushConsumer.setMessageListener(new MessageListenerOrderly() {
            @Override
            public ConsumeOrderlyStatus consumeMessage(List<MessageExt> list, ConsumeOrderlyContext consumeOrderlyContext) {
                for (int i = 0; i < list.size(); i++) {
                    System.out.println("消息消费成功" + new String(list.get(i).getBody()));
                }
                return ConsumeOrderlyStatus.SUCCESS;
            }
        });//设置消费方式

//        //这里是设置MessageListenerConcurrently 并发消费
//        defaultMQPushConsumer.setMessageListener(new MessageListenerConcurrently() {//new的是并发消费 所以无序
//            @Override
//            public ConsumeConcurrentlyStatus consumeMessage(List<MessageExt> list, ConsumeConcurrentlyContext consumeConcurrentlyContext) {
//                for (int i = 0; i < list.size(); i++) {
//                    System.out.println("消息消费成功" + new String(list.get(i).getBody()));
//                }
//                return ConsumeConcurrentlyStatus.CONSUME_SUCCESS;
//            }
//        });//消费方式
        defaultMQPushConsumer.start();
        System.out.println("Consumer Started.");
    }
}
