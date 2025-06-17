package org.zaohu.example.rocketMQ.consumer;

import org.apache.rocketmq.client.consumer.DefaultMQPushConsumer;
import org.apache.rocketmq.client.consumer.listener.ConsumeConcurrentlyContext;
import org.apache.rocketmq.client.consumer.listener.ConsumeConcurrentlyStatus;
import org.apache.rocketmq.client.consumer.listener.MessageListenerConcurrently;
import org.apache.rocketmq.client.exception.MQClientException;
import org.apache.rocketmq.common.message.MessageExt;
import org.apache.rocketmq.remoting.protocol.heartbeat.MessageModel;

import java.util.List;

/**
 * 广播模式消费 集群模式消费
 * 这里测试可以起两个这个main在右上角启动配置里复制一个就可以
*{@code @Author}  Zaohu
*{@code @CreateTime}  2024/11/28
**/
public class BroadcastConsumer {
    public static void main(String[] args) throws MQClientException {

        //push推模式 被动获取消息
        DefaultMQPushConsumer defaultMQPushConsumer = new DefaultMQPushConsumer("Example_Consumer");
        defaultMQPushConsumer.setNamesrvAddr("127.0.0.1:9876");
        defaultMQPushConsumer.subscribe("Example","*");

        //接下来指定消息分发模式
        //MessageModel.BROADCASTING 广播模式：
        //      如果消费者产生了十条消息给Topic 只要监听Topic的所有 广播 模式的消费者都会去消费十条
        //MessageModel.CLUSTERING 集群模式
        //      如果消费者产生了十条消息给Topic 只要监听Topic的所有 集群 模式的消费者都会去抢这些消息消费，但每个消息只消费一次
        defaultMQPushConsumer.setMessageModel(MessageModel.CLUSTERING);
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
