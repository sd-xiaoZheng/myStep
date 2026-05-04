package org.zaohu.jobs.schedulJob;

import co.elastic.clients.elasticsearch.ElasticsearchClient;
import co.elastic.clients.elasticsearch.core.BulkResponse;
import co.elastic.clients.elasticsearch.core.bulk.BulkOperation;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.zaohu.constant.es.createIndex.CreateIndex;
import org.zaohu.modules.article.entity.Article;
import org.zaohu.modules.article.mapper.ArticleMapper;
import org.zaohu.modules.tag.entity.Tag;
import org.zaohu.modules.tag.mapper.TagMapper;
import org.zaohu.modules.tagRelation.entity.TagRelation;
import org.zaohu.modules.tagRelation.mapper.TagRelationMapper;

import java.io.IOException;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;

@Slf4j
@Component
@RequiredArgsConstructor
public class SyncDataBase2Es {
    private final ElasticsearchClient elasticsearchClient;
    private final ArticleMapper articleMapper;
    private final TagRelationMapper tagRelationMapper;
    private final TagMapper tagMapper;

    private static final int PAGE_SIZE = 500;

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
            log.error("初始化ES索引失败", e);
        }
    }

    @Scheduled(initialDelay = 3000L, fixedDelay = 1000 * 60 * 10L)
//    @Scheduled(initialDelay = 3000L, fixedDelay = 10000L)
    public void article2Es() {
        log.info("执行article2Es");
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss");
        int totalSynced = 0;
        int offset = 0;

        while (true) {
            LambdaQueryWrapper<Article> wrapper = new LambdaQueryWrapper<>();
            wrapper.last("LIMIT " + PAGE_SIZE + " OFFSET " + offset);
            List<Article> articles = articleMapper.selectList(wrapper);

            if (articles == null || articles.isEmpty()) {
                break;
            }

            // 批量查询标签
            List<String> articleIds = articles.stream().map(Article::getId).toList();
            Map<String, List<Tag>> articleTagsMap = batchQueryTags(articleIds);

            // 构建 bulk 操作
            List<BulkOperation> operations = new ArrayList<>();
            for (Article article : articles) {
                List<Tag> tags = articleTagsMap.getOrDefault(article.getId(), List.of());
                Map<String, Object> esDoc = buildEsDoc(article, tags, formatter);
                operations.add(BulkOperation.of(op -> op.index(idx -> idx
                        .index("article_index")
                        .id(article.getId())
                        .document(esDoc)
                )));
            }

            // 批量写入 ES
            try {
                BulkResponse response = elasticsearchClient.bulk(b -> b.operations(operations));
                if (response.errors()) {
                    response.items().stream()
                            .filter(item -> item.error() != null)
                            .forEach(item -> log.error("ES批量写入失败: id={}, error={}",
                                    item.id(), item.error().reason()));
                }
                totalSynced += articles.size();
            } catch (IOException e) {
                log.error("ES批量写入异常，本批{}条", articles.size(), e);
            }

            if (articles.size() < PAGE_SIZE) {
                break;
            }
            offset += PAGE_SIZE;
        }

        log.info("article2Es完成，共同步{}条", totalSynced);
    }

    /**
     * 一次性批量查询所有文章的标签，按 articleId 分组返回
     */
    private Map<String, List<Tag>> batchQueryTags(List<String> articleIds) {
        if (articleIds.isEmpty()) {
            return Map.of();
        }

        LambdaQueryWrapper<TagRelation> rw = new LambdaQueryWrapper<>();
        rw.in(TagRelation::getArticleId, articleIds);
        List<TagRelation> relations = tagRelationMapper.selectList(rw);
        if (relations.isEmpty()) {
            return Map.of();
        }

        Set<Integer> tagIds = relations.stream()
                .map(TagRelation::getTagId)
                .collect(Collectors.toSet());
        List<Tag> tags = tagMapper.selectByIds(tagIds);
        Map<Integer, Tag> tagMap = tags.stream()
                .collect(Collectors.toMap(Tag::getId, t -> t, (a, b) -> a));

        return relations.stream().collect(Collectors.groupingBy(
                TagRelation::getArticleId,
                Collectors.mapping(tr -> tagMap.get(tr.getTagId()), Collectors.toList())
        ));
    }

    private Map<String, Object> buildEsDoc(Article article, List<Tag> tags, DateTimeFormatter formatter) {
        Map<String, Object> esDoc = new HashMap<>();
        esDoc.put("id", article.getId());
        esDoc.put("typeId", article.getTypeId());
        esDoc.put("title", article.getTitle());
        esDoc.put("content", article.getContent());
        esDoc.put("writeTime", article.getWriteTime() == null ? null : article.getWriteTime().format(formatter));
        esDoc.put("memoryTime", article.getMemoryTime() == null ? null : article.getMemoryTime().format(formatter));
        esDoc.put("weatherId", article.getWeatherId());
        esDoc.put("moodId", article.getMoodId());
        esDoc.put("authorName", article.getAuthorName());
        esDoc.put("authorId", article.getAuthorId());
        esDoc.put("isStar", article.getIsStar());
        esDoc.put("address", article.getAddress());
        esDoc.put("color", article.getColor());
        esDoc.put("imageUrls", article.getImageUrls());
        esDoc.put("authorAvatar", article.getAuthorAvatar());
        esDoc.put("typeName", article.getTypeName());
        esDoc.put("weatherName", article.getWeatherName());
        esDoc.put("moodName", article.getMoodName());

        List<Map<String, Object>> tagList = tags.stream().map(tag -> {
            Map<String, Object> tagMap = new HashMap<>();
            tagMap.put("id", tag.getId());
            tagMap.put("name", tag.getName());
            return tagMap;
        }).toList();
        esDoc.put("tags", tagList);

        return esDoc;
    }
}
