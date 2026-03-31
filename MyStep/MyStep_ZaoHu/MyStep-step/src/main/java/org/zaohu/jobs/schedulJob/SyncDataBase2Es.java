package org.zaohu.jobs.schedulJob;

import co.elastic.clients.elasticsearch.ElasticsearchClient;
import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.zaohu.constant.es.createIndex.CreateIndex;

@Slf4j
@Component
@RequiredArgsConstructor
public class SyncDataBase2Es {
    private final ElasticsearchClient elasticsearchClient;

    @PostConstruct
    public void init() {
        try {
            boolean exists = elasticsearchClient.indices()
                    .exists(e -> e.index("article_index"))
                    .value();
            if (!exists) {
                CreateIndex.createIndex(elasticsearchClient);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * initialDelay 程序启动后间隔 xx毫秒启动，这个initialDelay只执行一次
     */
    @Scheduled(initialDelay = 3000L,fixedDelay = 1000*60*10L)//每十分钟一次@Scheduled(cron = "0 0/10 * * * ?")//每十分钟一次
    public void article2Es() {
        log.info("==============================执行article2Es==============================");
    }
}
