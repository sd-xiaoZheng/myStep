package org.zaohu.example.rocketMQ.consumer;

import org.apache.rocketmq.client.consumer.DefaultLitePullConsumer;
import org.apache.rocketmq.client.exception.MQClientException;
import org.apache.rocketmq.common.message.MessageExt;
import org.apache.rocketmq.common.message.MessageQueue;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * 拉模式-指定获取一个Queue中的消息
 */
public class litePullConsumerAssign {
    public static void main(String[] args) throws MQClientException {
        DefaultLitePullConsumer LitePullConsumer = new DefaultLitePullConsumer("LitePullConsumer");
        LitePullConsumer.setNamesrvAddr("localhost:9876");//告诉他地址
        LitePullConsumer.start();//启动消费者
        Collection<MessageQueue> example = LitePullConsumer.fetchMessageQueues("Example");//指定获取哪个topic下的queue
        LitePullConsumer.assign(example);
        ArrayList<MessageQueue> messageQueues = new ArrayList<>(example);
        LitePullConsumer.seek(messageQueues.get(1),10);
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
