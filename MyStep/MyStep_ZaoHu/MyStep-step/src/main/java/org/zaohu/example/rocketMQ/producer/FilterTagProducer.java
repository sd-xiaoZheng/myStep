package org.zaohu.example.rocketMQ.producer;

import org.apache.rocketmq.client.exception.MQBrokerException;
import org.apache.rocketmq.client.exception.MQClientException;
import org.apache.rocketmq.client.producer.DefaultMQProducer;
import org.apache.rocketmq.client.producer.SendResult;
import org.apache.rocketmq.common.message.Message;
import org.apache.rocketmq.remoting.exception.RemotingException;

import java.nio.charset.StandardCharsets;

/**
 * 过滤消息生产者-Tag方式
 * @author Zaohu
 * @since 2024/11/30
 **/
public class FilterTagProducer {
    public static void main(String[] args) throws MQBrokerException, RemotingException, InterruptedException, MQClientException {
        DefaultMQProducer syncProducer = new DefaultMQProducer("FilterTagProducer");
        syncProducer.setNamesrvAddr("127.0.0.1:9876");
        syncProducer.start();
        String[] tags = {"TagA", "TagB", "TagC"};
        for (int i = 0; i < 10; i++) {
            Message message = new Message("Filter", tags[i%tags.length], (tags[i%tags.length]+ "_FilterTagProducer").getBytes(StandardCharsets.UTF_8));
            SendResult sendResult = syncProducer.send(message);
            System.out.println(tags[i%tags.length]+"_消息发送成功"+sendResult);
        }
        syncProducer.shutdown();
    }
}
