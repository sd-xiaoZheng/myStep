package org.zaohu.example.rocketMQ.producer;

import org.apache.rocketmq.client.exception.MQBrokerException;
import org.apache.rocketmq.client.exception.MQClientException;
import org.apache.rocketmq.client.producer.DefaultMQProducer;
import org.apache.rocketmq.common.message.Message;
import org.apache.rocketmq.remoting.exception.RemotingException;

import java.nio.charset.StandardCharsets;

/**
 * 单向发送 不管消息有没有发送成功
 * 效率最高 但安全最低 broker有没有接收到消息不管
 * 场景：日志收集
 */
public class OnewayProducer {
    public static void main(String[] args) throws MQClientException, MQBrokerException, RemotingException, InterruptedException {
        DefaultMQProducer syncProducer = new DefaultMQProducer("SyncProducer");
        syncProducer.setNamesrvAddr("127.0.0.1:9876");
        syncProducer.start();
        for (int i = 0; i < 10; i++) {
            Message message = new Message("Example", "Tags", (i + "_Example").getBytes(StandardCharsets.UTF_8));
            syncProducer.sendOneway(message);
            System.out.println(i+"_消息发送成功");
        }
        syncProducer.shutdown();
    }
}
