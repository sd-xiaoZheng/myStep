package org.zaohu.jobs.rocketMq.consumer;

import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.spring.annotation.RocketMQMessageListener;
import org.apache.rocketmq.spring.core.RocketMQListener;
import org.springframework.stereotype.Service;
import org.zaohu.constant.Constant;
import org.zaohu.utils.PhotoDisposeUtils;

import java.time.LocalDate;

@Service
@Slf4j
@RocketMQMessageListener(topic = Constant.ROCKET_IMAGE_THUMB_TOPIC, selectorExpression = "*", consumerGroup = "imgThumbGroup")
public class ImageThumbConsumer implements RocketMQListener<String> {
    @Override
    public void onMessage(String imagePathJson) {
        LocalDate currentDate = LocalDate.now();
        String year = String.valueOf(currentDate.getYear());
        String month = String.format("%02d", currentDate.getMonthValue());

        String[] split = imagePathJson.split("/");
        String fileName = split[split.length - 1].split("\\.")[0];
        PhotoDisposeUtils.convertWebpWithLossyCompression(
                imagePathJson,
                Constant.FILE_PATH + year + Constant.PHOTO_PATH + month + "/" + fileName + ".webp",
                0.2f
        );
        System.out.println("我消费了消息" + imagePathJson);
    }
}