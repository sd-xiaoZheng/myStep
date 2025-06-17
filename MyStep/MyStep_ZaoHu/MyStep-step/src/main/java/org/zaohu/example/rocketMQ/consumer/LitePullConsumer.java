package org.zaohu.example.rocketMQ.consumer;

import org.apache.rocketmq.client.consumer.DefaultLitePullConsumer;
import org.apache.rocketmq.client.exception.MQClientException;
import org.apache.rocketmq.common.message.MessageExt;

import java.util.List;

/**
 * 拉模式消费者 随机获取一个Queue中的消息
 */
public class LitePullConsumer {
    public static void main(String[] args) throws MQClientException {
        DefaultLitePullConsumer LitePullConsumer = new DefaultLitePullConsumer("LitePullConsumer");
        LitePullConsumer.setNamesrvAddr("localhost:9876");//告诉他地址
        LitePullConsumer.subscribe("Example", "*");//告诉去哪个topic中去消费
        LitePullConsumer.start();//启动
        //拉取消息
        while (true) {
            List<MessageExt> poll = LitePullConsumer.poll();
            System.out.println("消息拉取成功");
            poll.forEach(n->{
                System.out.println("消息消费成功"+n);
            });
        }
    }
}
