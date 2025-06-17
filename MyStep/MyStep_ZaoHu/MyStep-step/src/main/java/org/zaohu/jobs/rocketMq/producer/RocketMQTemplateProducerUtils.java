package org.zaohu.jobs.rocketMq.producer;

import com.alibaba.fastjson.JSON;
import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.client.producer.SendCallback;
import org.apache.rocketmq.client.producer.SendResult;
import org.apache.rocketmq.spring.core.RocketMQTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.Message;
import org.springframework.messaging.support.MessageBuilder;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Step
 * 同步发送 sync
 * 发送消息采用同步模式，这种方式只有在消息完全发送完成之后才返回结果，此方式存在需要同步等待发送结果的时间代价。
 * 这种方式具有内部重试机制，即在主动声明本次消息发送失败之前，内部实现将重试一定次数，默认为2次（DefaultMQProducer＃getRetryTimesWhenSendFailed）。
 * 发送的结果存在同一个消息可能被多次发送给给broker，这里需要应用的开发者自己在消费端处理幂

 ==========================
 异步发送 async
 发送消息采用异步发送模式，消息发送后立刻返回，当消息完全完成发送后，会调用回调函数sendCallback来告知发送者本次发送是成功或者失败。
 异步模式通常用于响应时间敏感业务场景，即承受不了同步发送消息时等待返回的耗时代价。

 同同步发送一样，异步模式也在内部实现了重试机制，默认次数为2次（DefaultMQProducer#getRetryTimesWhenSendAsyncFailed}）。
 发送的结果同样存在同一个消息可能被多次发送给给broker，需要应用的开发者自己在消费端处理幂等性问题。

 ==========================
 直接发送 one-way
 采用one-way发送模式发送消息的时候，发送端发送完消息后会立即返回，不会等待来自broker的ack来告知本次消息发送是否完全完成发送。
 这种方式吞吐量很大，但是存在消息丢失的风险，所以其适用于不重要的消息发送，比如日志收集。

 ==========================
 总结
 在实际使用场景中，利用何种发送方式，可以总结如下：
    当发送的消息不重要时，采用one-way方式，以提高吞吐量；
    当发送的消息很重要是，且对响应时间不敏感的时候采用sync方式;
    当发送的消息很重要，且对响应时间非常敏感的时候采用async方式；
 */
@Slf4j
@Service
public  class RocketMQTemplateProducerUtils {

    @Autowired
    private RocketMQTemplate template;

    /**
     * 发送普通消息
     *
     * 单向发送 最快
     * @param topic   topic
     * @param message 消息体
     */
    public void sendMessage(String topic, Object message) {
        template.convertAndSend(topic, message);
        log.info("普通消息发送完成：message = {}", message);
    }

    /**
     * 发送同步消息
     *
     * @param topic   topic
     * @param message 消息体
     */
    public void syncSendMessage(String topic, Object message) {
        SendResult sendResult = template.syncSend(topic, message);
        log.info("同步发送消息完成：message = {}, sendResult = {}", message, sendResult);
    }

    /**
     * 发送异步消息
     *
     * @param topic   topic
     * @param message 消息体
     */
    public void asyncSendMessage(String topic, Object message) {
        template.asyncSend(topic, message, new SendCallback() {
            @Override
            public void onSuccess(SendResult sendResult) {
                log.info("异步消息发送成功，message = {}, SendStatus = {}", message, sendResult.getSendStatus());
            }

            @Override
            public void onException(Throwable e) {
                log.info("异步消息发送异常，exception = {}", e.getMessage());
            }
        });
    }

    /**
     * 发送单向消息
     *采用one-way发送模式发送消息的时候，发送端发送完消息后会立即返回，不会等待来自broker的ack来告知本次消息发送是否完全完成发送。
     * 这种方式吞吐量很大，但是存在消息丢失的风险，所以其适用于不重要的消息发送，比如日志收集。
     * @param topic   topic
     * @param message 消息体
     */
    public void sendOneWayMessage(String topic, Object message) {
        template.sendOneWay(topic, message);
        log.info("单向发送消息完成：message = {}", message);
    }

    /**
     * 同步发送批量消息
     *
     * @param topic       topic
     * @param messageList 消息集合
     * @param timeout     超时时间（毫秒）
     */
    public void syncSendMessages(String topic, List<Message<?>> messageList, long timeout) {
        template.syncSend(topic, messageList, timeout);
        log.info("同步发送批量消息完成：message = {}", JSON.toJSONString(messageList));
    }

    /**
     * 发送事务消息
     *
     * @param topic   topic
     * @param message 消息对象
     */
//    public void sendMessageInTransaction(String topic, SysUserDto message) {
//        String transactionId = UUID.randomUUID().toString();
//        TransactionSendResult result = this.template.sendMessageInTransaction(topic, MessageBuilder.withPayload(message)
//                .setHeader(RocketMQHeaders.TRANSACTION_ID, transactionId)
//                .build(), message);
//        log.info("发送事务消息（半消息）完成：result = {}", result);
//    }

    /**
     * 发送携带 tag 的消息（过滤消息）
     *
     * @param topic   topic，RocketMQTemplate将 topic 和 tag 合二为一了，底层会进行
     *                拆分再组装。只要在指定 topic 时跟上 {:tags} 就可以指定tag
     *                例如 test-topic:tagA
     * @param message 消息体
     */
    public void syncSendMessageWithTag(String topic, Object message) {
        template.syncSend(topic, message);
        log.info("发送带 tag 的消息完成：message = {}", message);
    }

    /**
     * 同步发送延时消息
     *
     * @param topic      topic
     * @param message    消息体
     * @param timeout    超时
     * @param delayLevel 延时等级：现在RocketMq并不支持任意时间的延时，需要设置几个固定的延时等级，
     *                   从1s到2h分别对应着等级 1 到 18，消息消费失败会进入延时消息队列
     *                   "1s 5s 10s 30s 1m 2m 3m 4m 5m 6m 7m 8m 9m 10m 20m 30m 1h 2h";
     */
    public void syncSendDelay(String topic, Object message, long timeout, int delayLevel) {
        template.syncSend(topic, MessageBuilder.withPayload(message).build(), timeout, delayLevel);
        log.info("已同步发送延时消息 message = {}", message);
    }

    /**
     * 异步发送延时消息
     *
     * @param topic      topic
     * @param message    消息对象
     * @param timeout    超时时间
     * @param delayLevel 延时等级
     */
    public void asyncSendDelay(String topic, Object message, long timeout, int delayLevel) {
        template.asyncSend(topic, MessageBuilder.withPayload(message).build(), new SendCallback() {
            @Override
            public void onSuccess(SendResult sendResult) {
                log.info("异步发送延时消息成功，message = {}", message);
            }

            @Override
            public void onException(Throwable throwable) {
                log.error("异步发送延时消息发生异常，exception = {}", throwable.getMessage());
            }
        }, timeout, delayLevel);
        log.info("已异步发送延时消息 message = {}", message);
    }

    /**
     * 发送单向顺序消息
     *
     * @param topic topic
     */
    public void sendOneWayOrderly(String topic) {
        for (int i = 0; i < 30; i++) {
            template.sendOneWayOrderly(topic, MessageBuilder.withPayload("message - " + i).build(), "topic");
            log.info("单向顺序发送消息完成：message = {}", "message - " + i);
        }
    }

    /**
     * 同步发送顺序消息
     *
     * @param topic topic
     */
    public void syncSendOrderly(String topic) {
        for (int i = 0; i < 30; i++) {
            SendResult sendResult = template.syncSendOrderly(topic, MessageBuilder.withPayload("message - " + i).build(), "syncOrderlyKey");
            log.info("同步顺序发送消息完成：message = {}, sendResult = {}", "message - " + i, sendResult);
        }
    }
}




