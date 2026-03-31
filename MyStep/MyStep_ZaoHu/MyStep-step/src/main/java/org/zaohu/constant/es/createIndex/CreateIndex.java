package org.zaohu.constant.es.createIndex;

import co.elastic.clients.elasticsearch.ElasticsearchClient;

import java.io.IOException;

public class CreateIndex {

    public static void createIndex(ElasticsearchClient elasticsearchClient) throws IOException {
        elasticsearchClient.indices().create(c -> c
                .index("article_index")
                .mappings(m -> m
                        .properties("id", p -> p.keyword(k -> k))
                        .properties("typeId", p -> p.integer(i -> i))
                        .properties("title", p -> p.text(t -> t))
                        .properties("content", p -> p.text(t -> t))
                        .properties("writeTime", p -> p.date(d -> d
                                .format("yyyy-MM-dd HH:mm:ss||yyyy-MM-dd'T'HH:mm:ss")
                        ))
                        .properties("memoryTime", p -> p.date(d -> d
                                .format("yyyy-MM-dd HH:mm:ss||yyyy-MM-dd'T'HH:mm:ss")
                        ))
                        .properties("weatherId", p -> p.integer(i -> i))
                        .properties("moodId", p -> p.integer(i -> i))
                        .properties("authorName", p -> p.keyword(k -> k))
                        .properties("authorId", p -> p.long_(l -> l))
                        .properties("authorAvatar", p -> p.keyword(k -> k.index(false)))
                        .properties("color", p -> p.keyword(k -> k))
                        .properties("imageUrls", p -> p.keyword(k -> k.index(false)))
                        .properties("isStar", p -> p.boolean_(b -> b))
                        .properties("address", p -> p.text(t -> t))
                        .properties("typeName", p -> p.keyword(k -> k))
                        .properties("weatherName", p -> p.keyword(k -> k))
                        .properties("moodName", p -> p.keyword(k -> k))
                        .properties("tags", p -> p.nested(n -> n
                                .properties("id", np -> np.integer(i -> i))
                                .properties("name", np -> np.keyword(k -> k))
                        ))
                )
        );
    }
}
