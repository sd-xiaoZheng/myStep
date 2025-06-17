package org.zaohu.example.rocketMQ.producer;

import org.apache.rocketmq.client.exception.MQBrokerException;
import org.apache.rocketmq.client.exception.MQClientException;
import org.apache.rocketmq.client.producer.DefaultMQProducer;
import org.apache.rocketmq.client.producer.SendResult;
import org.apache.rocketmq.common.message.Message;
import org.apache.rocketmq.remoting.exception.RemotingException;

import java.nio.charset.StandardCharsets;
import java.time.LocalTime;

/**
 * 预定日程生产者 延迟消息
 * @author  Zaohu
 * @since  2024/11/28
 **/
public class ScheduleProducer  {
    public static void main(String[] args) throws MQClientException, MQBrokerException, RemotingException, InterruptedException {
        DefaultMQProducer syncProducer = new DefaultMQProducer("ScheduleProducer");
        syncProducer.setNamesrvAddr("127.0.0.1:9876");
        syncProducer.start();
        for (int i = 0; i < 10; i++) {
            Message message = new Message("Schedule", "Tags", (i + "_ScheduleProducer").getBytes(StandardCharsets.UTF_8));
            //---第一==>>>为消息设置延迟，1-18分别为：1s 5s 10s 30s 1m 2m 3m 4m 5m 6m 7m 8m 9m 10m 20m 30m 1h 2h
            //message.setDelayTimeLevel(2);
            //---第二==>>>直接指定发送的延迟时间
            message.setDelayTimeMs(10000L);
            syncProducer.send(message);
            System.out.println(i+"_消息发送成功:"+ LocalTime.now());
        }
        syncProducer.shutdown();
    }
}
