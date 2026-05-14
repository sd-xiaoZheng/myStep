package org.zaohu.jobs.rocketMq.consumer;

import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.spring.annotation.RocketMQMessageListener;
import org.apache.rocketmq.spring.core.RocketMQListener;
import org.springframework.stereotype.Service;
import org.zaohu.constant.Constant;

import java.time.LocalDate;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import static org.zaohu.utils.photoutils.PhotoDisposeUtils.convertAndGenerateWebpThumbnail;

@Service
@Slf4j
@RocketMQMessageListener(topic = Constant.ROCKET_IMAGE_THUMB_TOPIC, selectorExpression = "*", consumerGroup = "imgThumbGroup",
        consumeThreadNumber = 50, consumeThreadMax = 200)
public class ImageThumbConsumer implements RocketMQListener<String> {

    private static final ExecutorService VIRTUAL_EXECUTOR = Executors.newVirtualThreadPerTaskExecutor();

    @Override
    public void onMessage(String imagePathJson) {
        try {
            VIRTUAL_EXECUTOR.submit(() -> {
                LocalDate currentDate = LocalDate.now();
                String year = String.valueOf(currentDate.getYear());
                String month = String.format("%02d", currentDate.getMonthValue());
                String[] split = imagePathJson.split("/");
                String fileName = split[split.length - 1].split("\\.")[0];
                convertAndGenerateWebpThumbnail(
                        imagePathJson,
                        Constant.FILE_PATH + year + Constant.PHOTO_PATH + month + "/" + fileName + ".webp",
                        0.5f,
                        0.2f
                );
                log.info("我消费了消息{}", imagePathJson);
            }).get();
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        } catch (ExecutionException e) {
            log.error("图片缩略图处理失败: {}", imagePathJson, e.getCause());
        }
    }
}