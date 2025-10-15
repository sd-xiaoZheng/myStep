package org.zaohu.jobs.rocketMq.consumer;

import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.spring.annotation.RocketMQMessageListener;
import org.apache.rocketmq.spring.core.RocketMQListener;
import org.springframework.stereotype.Service;
import org.zaohu.constant.Constant;

import java.time.LocalDate;

import static org.zaohu.utils.photoutils.PhotoDisposeUtils.convertAndGenerateWebpThumbnail;

@Service
@Slf4j
@RocketMQMessageListener(topic = Constant.ROCKET_IMAGE_THUMB_TOPIC, selectorExpression = "*", consumerGroup = "imgThumbGroup")
public class ImageThumbConsumer implements RocketMQListener<String> {
    @Override
    public void onMessage(String imagePathJson) {
        //转webp再缩略图
        LocalDate currentDate = LocalDate.now();
        String year = String.valueOf(currentDate.getYear());
        String month = String.format("%02d", currentDate.getMonthValue());
        String[] split = imagePathJson.split("/");
        String fileName = split[split.length - 1].split("\\.")[0];
        //转webp再缩略图
        convertAndGenerateWebpThumbnail(
                imagePathJson,
                Constant.FILE_PATH + year + Constant.PHOTO_PATH + month + "/" + fileName + ".webp",
                0.5f,
                0.2f
        );
        log.info("我消费了消息{}", imagePathJson);
    }
}