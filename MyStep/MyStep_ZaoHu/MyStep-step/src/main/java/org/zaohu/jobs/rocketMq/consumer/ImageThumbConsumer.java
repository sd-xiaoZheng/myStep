package org.zaohu.jobs.rocketMq.consumer;

import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.spring.annotation.RocketMQMessageListener;
import org.apache.rocketmq.spring.core.RocketMQListener;
import org.springframework.stereotype.Service;
import org.zaohu.constant.Constant;

@Service
@Slf4j
@RocketMQMessageListener(topic = Constant.ROCKET_IMAGE_THUMB_TOPIC, selectorExpression = "*", consumerGroup = "imgThumbGroup")
public class ImageThumbConsumer implements RocketMQListener<String> {
    @Override
    public void onMessage(String imagePathJson) {
        System.out.println("我消费了消息"+imagePathJson);
    }
}