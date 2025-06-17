package org.zaohu.example.rocketMQ.producer;

import org.apache.rocketmq.client.exception.MQBrokerException;
import org.apache.rocketmq.client.exception.MQClientException;
import org.apache.rocketmq.client.producer.DefaultMQProducer;
import org.apache.rocketmq.client.producer.SendResult;
import org.apache.rocketmq.common.message.Message;
import org.apache.rocketmq.remoting.exception.RemotingException;

import java.nio.charset.StandardCharsets;

/**
 * 同步发送 等待消费者返回再进行下一步
 */
public class SyncProducer {
    public static void main(String[] args) throws MQClientException, MQBrokerException, RemotingException, InterruptedException {
        DefaultMQProducer syncProducer = new DefaultMQProducer("SyncProducer");
        syncProducer.setNamesrvAddr("127.0.0.1:9876");
        syncProducer.start();
        for (int i = 0; i < 10; i++) {
            Message message = new Message("Example", "Tags", (i + "_Example").getBytes(StandardCharsets.UTF_8));
            SendResult sendResult = syncProducer.send(message);
            System.out.println(i+"_消息发送成功"+sendResult);
        }
        syncProducer.shutdown();
    }
}
