package org.zaohu.modules.article.service.Impl;

import cn.hutool.core.bean.BeanUtil;
import co.elastic.clients.elasticsearch.ElasticsearchClient;
import co.elastic.clients.elasticsearch._types.FieldValue;
import co.elastic.clients.elasticsearch._types.query_dsl.BoolQuery;
import co.elastic.clients.elasticsearch._types.query_dsl.Query;
import co.elastic.clients.elasticsearch.core.SearchResponse;
import co.elastic.clients.elasticsearch.core.search.HighlightField;
import co.elastic.clients.elasticsearch.core.search.Hit;
import co.elastic.clients.json.JsonData;
import co.elastic.clients.util.NamedValue;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.zaohu.common.conditionalAssembler.ConditionalAssembler;
import org.zaohu.common.entity.KeyIntegerValueObj;
import org.zaohu.modules.article.entity.Article;
import org.zaohu.modules.article.entity.vo.ArticleVO;
import org.zaohu.modules.article.entity.vo.GetArticleVo;
import org.zaohu.modules.article.entity.vo.UpdateArticleVO;
import org.zaohu.modules.article.mapper.ArticleMapper;
import org.zaohu.modules.article.service.ArticleService;
import org.zaohu.modules.mood.entity.Mood;
import org.zaohu.modules.mood.mapper.MoodMapper;
import org.zaohu.modules.tag.entity.Tag;
import org.zaohu.modules.tag.mapper.TagMapper;
import org.zaohu.modules.tagRelation.entity.TagRelation;
import org.zaohu.modules.tagRelation.mapper.TagRelationMapper;
import org.zaohu.modules.type.entity.Type;
import org.zaohu.modules.type.mapper.TypeMapper;
import org.zaohu.modules.userLogin.entity.User;
import org.zaohu.modules.weather.entity.Weather;
import org.zaohu.modules.weather.mapper.WeatherMapper;
import org.zaohu.utils.FileUtils;
import org.zaohu.utils.GetIPAddrUtil;
import org.zaohu.utils.RequestUtils;
import org.zaohu.utils.entity.IpRegion;
import org.zaohu.utils.security.SecurityUtils;
import org.zaohu.utils.text.StringUtils;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * <p>
 * 文章表 服务实现类
 * </p>
 *
 * @author tiehanrouqing
 * @since 2025-11-26 16:59:59
 */
@Service
@RequiredArgsConstructor
public class ArticleServiceImpl extends ServiceImpl<ArticleMapper, Article> implements ArticleService {

    private final ArticleMapper articleMapper;
    private final MoodMapper moodMapper;
    private final TypeMapper typeMapper;
    private final WeatherMapper weatherMapper;
    private final TagRelationMapper tagRelationMapper;
    private final TagMapper tagMapper;
    private final ElasticsearchClient elasticsearchClient;

    @Override
    public List<Article> getDairy(Article article) {
        //这里要从es中查询 目前先再mysql中查询
        LambdaQueryWrapper<Article> articleLqWrapper = ConditionalAssembler.AssemblyConditions(article);
        articleLqWrapper.orderBy(true, false, Article::getMemoryTime);
        List<Article> articles = articleMapper.selectList(articleLqWrapper);
        //TODO 这里先把这几个查出来 后面是否可以直接先提前查出来放入redis，更新时候也一起更新redis？
        HashSet<Integer> moodIds = new HashSet<>();
        HashSet<Integer> typeIds = new HashSet<>();
        HashSet<Integer> weatherIds = new HashSet<>();
        HashSet<String> articleIds = new HashSet<>();
        for (Article item : articles) {
            moodIds.add(item.getMoodId());
            typeIds.add(item.getTypeId());
            weatherIds.add(item.getWeatherId());
            articleIds.add(item.getId());
        }
        List<Mood> moods = moodMapper.selectByIds(moodIds);
        Map<Integer, String> moodMap = moods.stream()
                .collect(Collectors.toMap(
                        Mood::getId,
                        Mood::getName,
                        (oldValue, newValue) -> oldValue
                ));
        List<Type> types = typeMapper.selectByIds(typeIds);
        Map<Integer, String> typeMap = types.stream()
                .collect(Collectors.toMap(
                        Type::getId,
                        Type::getName,
                        (oldValue, newValue) -> oldValue
                ));
        List<Weather> weathers = weatherMapper.selectByIds(weatherIds);
        Map<Integer, String> weathersMap = weathers.stream()
                .collect(Collectors.toMap(
                        Weather::getId,
                        Weather::getLabel,
                        (oldValue, newValue) -> oldValue
                ));
        LambdaQueryWrapper<TagRelation> tagRelationLqw = new LambdaQueryWrapper<>();
        tagRelationLqw.in(TagRelation::getArticleId, articleIds);
        List<TagRelation> tagRelations = tagRelationMapper.selectList(tagRelationLqw);
        Set<Integer> tagIds = tagRelations.stream()
                .map(TagRelation::getTagId)
                .collect(Collectors.toSet());
        LambdaQueryWrapper<Tag> tagLqw = new LambdaQueryWrapper<>();
        tagLqw.in(Tag::getId, tagIds);
        tagLqw.orderBy(true, true, Tag::getSortNo);
        Map<Integer, Tag> tagMap = tagMapper.selectList(tagLqw).stream()
                .collect(Collectors.toMap(Tag::getId, Function.identity()));

        Map<String, List<Tag>> articleTagsMap = tagRelations.stream()
                .collect(Collectors.groupingBy(
                        TagRelation::getArticleId,
                        Collectors.mapping(
                                relation -> tagMap.get(relation.getTagId()),
                                Collectors.toList()
                        )
                ));

        for (Article item : articles) {
            item.setMoodName(moodMap.get(item.getMoodId()));
            item.setTypeName(typeMap.get(item.getTypeId()));
            item.setWeatherName(weathersMap.get(item.getWeatherId()));
            item.setTags(articleTagsMap.getOrDefault(item.getId(), new ArrayList<>()));
        }
        return articles;
    }

    @Override
    public Long selectCount(Article article) {
        return articleMapper.selectCount(null);
    }

    @Override
    @Transactional
    public void addArticle(ArticleVO articleVO) throws IOException {
        Article article = new Article();
        BeanUtil.copyProperties(articleVO, article);
        article.setWriteTime(LocalDateTime.now());
        User user = SecurityUtils.getUser();
        String username = user.getUsername();
        article.setAuthorName(username);
        article.setAuthorId(user.getUserId());
        article.setAuthorAvatar(user.getAvatar());
        String remoteHost = RequestUtils.getRequest().getRemoteHost();
        IpRegion ipRegion = GetIPAddrUtil.getIpRegion(remoteHost);
        String province = Objects.nonNull(ipRegion.getProvince()) && ipRegion.getProvince().equals("0") ? "未知" : ipRegion.getProvince();
        String city = Objects.nonNull(ipRegion.getCity()) && ipRegion.getCity().equals("0") ? "未知" : ipRegion.getCity();
        article.setAddress(province + city);
        MultipartFile[] images = articleVO.getImages();
        if (!StringUtils.isEmpty(images)) {
            for (MultipartFile image : images) {
                String imageUrls = article.getImageUrls();
                if (Objects.isNull(imageUrls)) {
                    article.setImageUrls(FileUtils.uploadImage(image));
                    continue;
                }
                article.setImageUrls(imageUrls + "," + FileUtils.uploadImage(image));
            }
        }
        boolean b = articleMapper.insertOrUpdate(article);
        if (b) {
            //添加文章标签对应关系
            Integer[] tags = articleVO.getTagIds();
            if (Objects.nonNull(tags)) {
                updateTags(article.getId(), tags);
            }
            // 构建ES文档
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss");
            Map<String, Object> esDoc = new HashMap<>();
            esDoc.put("id", article.getId());
            esDoc.put("typeId", article.getTypeId());
            esDoc.put("title", article.getTitle());
            esDoc.put("content", article.getContent());
            esDoc.put("writeTime", Objects.isNull(article.getWriteTime()) ? null : article.getWriteTime().format(formatter));
            esDoc.put("memoryTime", Objects.isNull(article.getMemoryTime()) ? null : article.getMemoryTime().format(formatter));
            esDoc.put("weatherId", article.getWeatherId());
            esDoc.put("moodId", article.getMoodId());
            esDoc.put("authorName", article.getAuthorName());
            esDoc.put("authorId", article.getAuthorId());
            esDoc.put("isStar", article.getIsStar());
            esDoc.put("address", article.getAddress());
            List<Map<String, Object>> tagList = new ArrayList<>();
            if (Objects.nonNull(tags) && tags.length > 0) {
                List<Tag> tagEntities = tagMapper.selectByIds(Arrays.asList(tags));
                for (Tag tag : tagEntities) {
                    Map<String, Object> tagMap = new HashMap<>();
                    tagMap.put("id", tag.getId());
                    tagMap.put("name", tag.getName());
                    tagList.add(tagMap);
                }
            }
            esDoc.put("tags", tagList);
            // 存入ES
            elasticsearchClient.index(i -> i
                    .index("article_index")
                    .id(article.getId())
                    .document(esDoc)
            );
        }
    }

    @Override
    @Transactional
    public void updateArticle(ArticleVO articleVO) {
        //把要更改的图片提取出来提出来
        List<UpdateArticleVO> updateFile = articleVO.getUpdateFile();
        if (Objects.nonNull(updateFile) && !updateFile.isEmpty()) {
            //更新图片并且删除文件
            for (UpdateArticleVO updateArticleVO : updateFile) {
                String oldUrl = updateArticleVO.getOldUrl();//旧的图片地址
                if (StringUtils.isEmpty(oldUrl) && Objects.nonNull(updateArticleVO.getNewImages())) {
                    //添加了新图片
                    String imageUrls = articleVO.getImageUrls();
                    if (StringUtils.isEmpty(imageUrls)) {
                        articleVO.setImageUrls(FileUtils.uploadImage(updateArticleVO.getNewImages()));
                        continue;
                    }
                    articleVO.setImageUrls(imageUrls + "," + FileUtils.uploadImage(updateArticleVO.getNewImages()));
                } else if (FileUtils.deleteImage(oldUrl)) {
                    //已经删除
                    MultipartFile newImages = updateArticleVO.getNewImages();//新的图片
                    articleVO.setImageUrls(articleVO.getImageUrls().replace(oldUrl, FileUtils.uploadImage(newImages)));
                }
            }
        }
        String deleteImages = articleVO.getDeleteImages();
        if (StringUtils.isNotEmpty(deleteImages)) {
            if (deleteImages.contains(",")) {
                String[] split = deleteImages.split(",");
                for (String s : split) {
                    FileUtils.deleteImage(s);
                }
            } else {
                FileUtils.deleteImage(deleteImages);
            }
            String imageUrls = articleVO.getImageUrls();
            articleVO.setImageUrls(StringUtils.strip(imageUrls.replace(deleteImages, ""), ","));
        }

        Article article = new Article();
        BeanUtil.copyProperties(articleVO, article);
        Integer[] tagIds = articleVO.getTagIds();
        if (Objects.nonNull(tagIds) && tagIds.length > 0) {
            updateTags(article.getId(), tagIds);
        }
        boolean b = articleMapper.insertOrUpdate(article);
        if (b) {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss");
            Map<String, Object> esDoc = new HashMap<>();
            esDoc.put("id", article.getId());
            esDoc.put("typeId", article.getTypeId());
            esDoc.put("title", article.getTitle());
            esDoc.put("content", article.getContent());
            esDoc.put("writeTime", Objects.isNull(article.getWriteTime()) ? null : article.getWriteTime().format(formatter));
            esDoc.put("memoryTime", Objects.isNull(article.getMemoryTime()) ? null : article.getMemoryTime().format(formatter));
            esDoc.put("weatherId", article.getWeatherId());
            esDoc.put("moodId", article.getMoodId());
            esDoc.put("authorName", article.getAuthorName());
            esDoc.put("authorId", article.getAuthorId());
            esDoc.put("isStar", article.getIsStar());
            esDoc.put("address", article.getAddress());
            List<Map<String, Object>> tagList = new ArrayList<>();
            if (Objects.nonNull(tagIds) && tagIds.length > 0) {
                List<Tag> tagEntities = tagMapper.selectByIds(Arrays.asList(tagIds));
                for (Tag tag : tagEntities) {
                    Map<String, Object> tagMap = new HashMap<>();
                    tagMap.put("id", tag.getId());
                    tagMap.put("name", tag.getName());
                    tagList.add(tagMap);
                }
            }
            esDoc.put("tags", tagList);
            try {
                elasticsearchClient.index(i -> i
                        .index("article_index")
                        .id(article.getId())
                        .document(esDoc)
                );
            } catch (IOException e) {
                throw new RuntimeException("更新ES失败", e);
            }
        }
    }

    @Override
    public void deleteArticle(ArticleVO articleVO) {
        Article article = articleMapper.selectById(articleVO.getId());
        if (Objects.nonNull(article)) {
            if (articleMapper.deleteById(article.getId()) > 0) {
                String imageUrls = article.getImageUrls();
                if (StringUtils.isNotEmpty(imageUrls)) {
                    if (imageUrls.contains(",")) {
                        String[] split = imageUrls.split(",");
                        for (String s : split) {
                            FileUtils.deleteImage(s);
                        }
                    } else {
                        FileUtils.deleteImage(imageUrls);
                    }
                }
                try {
                    elasticsearchClient.delete(d -> d
                            .index("article_index")
                            .id(article.getId())
                    );
                } catch (IOException e) {
                    throw new RuntimeException("删除ES记录失败", e);
                }
            }
        }
    }

    @Override
    public Map<String, Object> getFiltter() {
        List<Mood> moods = moodMapper.selectList(null);
        List<Type> types = typeMapper.selectList(null);
        List<Weather> weathers = weatherMapper.selectList(null);
        List<Tag> tags = tagMapper.selectList(null);
        HashMap<String, Object> resMap = new HashMap<>();
        resMap.put("mood", moods);
        resMap.put("type", types);
        resMap.put("weather", weathers);
        resMap.put("tag", tags);
        return resMap;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Article> getArticleByFiltter(GetArticleVo getArticleVo) {
        List<KeyIntegerValueObj> keyValueObj = getArticleVo.getKeyValueObj();
        List<Integer> moods = new ArrayList<>();
        List<Integer> type = new ArrayList<>();
        List<Integer> weather = new ArrayList<>();
        List<Integer> tag = new ArrayList<>();
        if (Objects.nonNull(keyValueObj)) {
            for (KeyIntegerValueObj valueObj : keyValueObj) {
                String key = valueObj.getKey();
                switch (key) {
                    case "mood":
                        moods.add(valueObj.getValue());
                        break;
                    case "type":
                        type.add(valueObj.getValue());
                        break;
                    case "weather":
                        weather.add(valueObj.getValue());
                        break;
                    case "tag":
                        tag.add(valueObj.getValue());
                        break;
                    default:
                        break;
                }
            }
        }

        BoolQuery.Builder boolQuery = new BoolQuery.Builder();

        // 时间范围过滤
        String startTime = getArticleVo.getStartTime();
        String endTime = getArticleVo.getEndTime();
        if (Objects.nonNull(startTime) && !startTime.isEmpty() && Objects.nonNull(endTime) && !endTime.isEmpty()) {
            boolQuery.filter(Query.of(q -> q.range(r -> r
                    .untyped(u -> u
                            .field("writeTime")
                            .gte(JsonData.of(startTime))
                            .lte(JsonData.of(endTime))
                    )
            )));
        }

        // 天气过滤
        if (!weather.isEmpty()) {
            boolQuery.filter(Query.of(q -> q.terms(t -> t
                    .field("weatherId")
                    .terms(tv -> tv.value(weather.stream().map(v -> FieldValue.of(v.longValue())).toList()))
            )));
        }

        // 心情过滤
        if (!moods.isEmpty()) {
            boolQuery.filter(Query.of(q -> q.terms(t -> t
                    .field("moodId")
                    .terms(tv -> tv.value(moods.stream().map(v -> FieldValue.of(v.longValue())).toList()))
            )));
        }

        // 类型过滤
        if (!type.isEmpty()) {
            boolQuery.filter(Query.of(q -> q.terms(t -> t
                    .field("typeId")
                    .terms(tv -> tv.value(type.stream().map(v -> FieldValue.of(v.longValue())).toList()))
            )));
        }

        // 标签过滤（nested查询）
        if (!tag.isEmpty()) {
            boolQuery.filter(Query.of(q -> q.nested(n -> n
                    .path("tags")
                    .query(nq -> nq.terms(t -> t
                            .field("tags.id")
                            .terms(tv -> tv.value(tag.stream().map(v -> FieldValue.of(v.longValue())).toList()))
                    ))
            )));
        }

        // 标题和内容全文搜索
        String title = getArticleVo.getTitle();
        String content = getArticleVo.getContent();
        List<Query> searchQueries = new ArrayList<>();
        if (Objects.nonNull(title) && !title.isEmpty()) {
            searchQueries.add(Query.of(q -> q.match(m -> m.field("title").query(title))));
        }
        if (Objects.nonNull(content) && !content.isEmpty()) {
            searchQueries.add(Query.of(q -> q.match(m -> m.field("content").query(content))));
        }
        if (!searchQueries.isEmpty()) {
            boolQuery.must(Query.of(q -> q.bool(b -> b.should(searchQueries))));
        }

        try {
            SearchResponse<Map> response = elasticsearchClient.search(s -> s
                            .index("article_index")
                            .query(q -> q.bool(boolQuery.build()))
                            .highlight(h -> h
                                    .fields(NamedValue.of("title", HighlightField.of(hf -> hf.preTags("<em>").postTags("</em>").numberOfFragments(0))),
                                            NamedValue.of("content", HighlightField.of(hf -> hf.preTags("<em>").postTags("</em>").numberOfFragments(1).fragmentSize(30))))
                            )
                            .size(100),
                    Map.class
            );

            List<Article> articles = new ArrayList<>();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss");

            for (Hit<Map> hit : response.hits().hits()) {
                Map<String, Object> source = hit.source();
                if (Objects.isNull(source)) {
                    continue;
                }

                Article article = new Article();
                article.setId((String) source.get("id"));
                article.setTypeId(toInt(source.get("typeId")));
                article.setTitle((String) source.get("title"));
                article.setContent((String) source.get("content"));

                String writeTimeStr = (String) source.get("writeTime");
                if (Objects.nonNull(writeTimeStr)) {
                    article.setWriteTime(LocalDateTime.parse(writeTimeStr, formatter));
                }
                String memoryTimeStr = (String) source.get("memoryTime");
                if (Objects.nonNull(memoryTimeStr)) {
                    article.setMemoryTime(LocalDateTime.parse(memoryTimeStr, formatter));
                }

                article.setWeatherId(toInt(source.get("weatherId")));
                article.setMoodId(toInt(source.get("moodId")));
                article.setAuthorName((String) source.get("authorName"));
                article.setAuthorId(toLong(source.get("authorId")));
                article.setAuthorAvatar((String) source.get("authorAvatar"));
                article.setColor((String) source.get("color"));
                article.setImageUrls((String) source.get("imageUrls"));
                article.setIsStar((Boolean) source.get("isStar"));
                article.setAddress((String) source.get("address"));
                article.setTypeName((String) source.get("typeName"));
                article.setWeatherName((String) source.get("weatherName"));
                article.setMoodName((String) source.get("moodName"));


                List<Map<String, Object>> tagsList = (List<Map<String, Object>>) source.get("tags");
                if (Objects.nonNull(tagsList)) {
                    List<Tag> tags = new ArrayList<>();
                    for (Map<String, Object> tagMap : tagsList) {
                        Tag t = new Tag();
                        t.setId(toInt(tagMap.get("id")));
                        t.setName((String) tagMap.get("name"));
                        tags.add(t);
                    }
                    article.setTags(tags);
                }

                // 高亮处理
                Map<String, List<String>> highlightMap = hit.highlight();
                if (Objects.nonNull(highlightMap)) {
                    List<String> titleHL = highlightMap.get("title");
                    if (Objects.nonNull(titleHL) && !titleHL.isEmpty()) {
                        article.setTitle(titleHL.get(0));
                    }
                    List<String> contentHL = highlightMap.get("content");
                    if (Objects.nonNull(contentHL) && !contentHL.isEmpty()) {
                        article.setContent(contentHL.get(0));
                    }
                }

                articles.add(article);
            }

            // 从数据库批量补齐ES中缺失的字段（名称、颜色、排序）
            enrichArticlesFromDb(articles);

            return articles;
        } catch (IOException e) {
            throw new RuntimeException("ES查询失败", e);
        }
    }

    /**
     * 从数据库批量补齐ES中缺失的字段：moodName/weatherName/typeName、tag的color和sortNo
     */
    private void enrichArticlesFromDb(List<Article> articles) {
        if (articles.isEmpty()) {
            return;
        }

        // 收集所有ID
        HashSet<Integer> moodIds = new HashSet<>();
        HashSet<Integer> typeIds = new HashSet<>();
        HashSet<Integer> weatherIds = new HashSet<>();
        HashSet<String> articleIds = new HashSet<>();
        for (Article article : articles) {
            if (Objects.nonNull(article.getMoodId())) moodIds.add(article.getMoodId());
            if (Objects.nonNull(article.getTypeId())) typeIds.add(article.getTypeId());
            if (Objects.nonNull(article.getWeatherId())) weatherIds.add(article.getWeatherId());
            articleIds.add(article.getId());
        }

        // 批量查心情名称
        Map<Integer, String> moodMap = Map.of();
        if (!moodIds.isEmpty()) {
            moodMap = moodMapper.selectByIds(moodIds).stream()
                    .collect(Collectors.toMap(Mood::getId, Mood::getName, (a, b) -> a));
        }

        // 批量查类型名称
        Map<Integer, String> typeMap = Map.of();
        if (!typeIds.isEmpty()) {
            typeMap = typeMapper.selectByIds(typeIds).stream()
                    .collect(Collectors.toMap(Type::getId, Type::getName, (a, b) -> a));
        }

        // 批量查天气名称
        Map<Integer, String> weatherMap = Map.of();
        if (!weatherIds.isEmpty()) {
            weatherMap = weatherMapper.selectByIds(weatherIds).stream()
                    .collect(Collectors.toMap(Weather::getId, Weather::getLabel, (a, b) -> a));
        }

        // 批量查标签（含color和sortNo）
        Map<String, List<Tag>> articleTagsMap = Map.of();
        if (!articleIds.isEmpty()) {
            LambdaQueryWrapper<TagRelation> trLqw = new LambdaQueryWrapper<>();
            trLqw.in(TagRelation::getArticleId, articleIds);
            List<TagRelation> relations = tagRelationMapper.selectList(trLqw);
            if (!relations.isEmpty()) {
                Set<Integer> tagIds = relations.stream()
                        .map(TagRelation::getTagId)
                        .collect(Collectors.toSet());
                LambdaQueryWrapper<Tag> tagLqw = new LambdaQueryWrapper<>();
                tagLqw.in(Tag::getId, tagIds);
                tagLqw.orderBy(true, true, Tag::getSortNo);
                Map<Integer, Tag> tagMap = tagMapper.selectList(tagLqw).stream()
                        .collect(Collectors.toMap(Tag::getId, Function.identity()));
                articleTagsMap = relations.stream().collect(Collectors.groupingBy(
                        TagRelation::getArticleId,
                        Collectors.mapping(tr -> tagMap.get(tr.getTagId()), Collectors.toList())
                ));
            }
        }

        // 回填各文章
        for (Article article : articles) {
            article.setMoodName(moodMap.get(article.getMoodId()));
            article.setTypeName(typeMap.get(article.getTypeId()));
            article.setWeatherName(weatherMap.get(article.getWeatherId()));
            article.setTags(articleTagsMap.getOrDefault(article.getId(), new ArrayList<>()));
        }
    }

    private void updateTags(String articleId, Integer[] tagIds) {
        ArrayList<TagRelation> tagRelations = new ArrayList<>();
        for (Integer tag : tagIds) {
            TagRelation tagRelation = new TagRelation();
            tagRelation.setArticleId(articleId);
            tagRelation.setTagId(tag);
            tagRelations.add(tagRelation);
        }
        LambdaQueryWrapper<TagRelation> tagRelationLqw = new LambdaQueryWrapper<>();
        tagRelationLqw.eq(TagRelation::getArticleId, articleId);
        tagRelationMapper.delete(tagRelationLqw);
        tagRelationMapper.insert(tagRelations);
    }

    @Override
    public List<Map<String, Object>> getYearlyActivity(String startTime, String endTime) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss");
        LocalDateTime start = LocalDateTime.parse(startTime, formatter);
        LocalDateTime end = LocalDateTime.parse(endTime, formatter);

        LambdaQueryWrapper<Article> wrapper = new LambdaQueryWrapper<>();
        wrapper.between(Article::getWriteTime, start, end);
        List<Article> articles = articleMapper.selectList(wrapper);

        Map<Integer, Long> countMap = articles.stream()
                .collect(Collectors.groupingBy(a -> a.getWriteTime().getMonthValue(), Collectors.counting()));

        List<Map<String, Object>> result = new ArrayList<>();
        int year = start.getYear();
        for (int m = 1; m <= 12; m++) {
            Map<String, Object> item = new HashMap<>();
            item.put("month", m);
            item.put("label", m + "月");
            item.put("count", countMap.getOrDefault(m, 0L));
            item.put("startDate", year + "-" + String.format("%02d", m) + "-01");
            int lastDay = m == 2 ? (java.time.Year.isLeap(year) ? 29 : 28)
                    : (m == 4 || m == 6 || m == 9 || m == 11 ? 30 : 31);
            item.put("endDate", year + "-" + String.format("%02d", m) + "-" + String.format("%02d", lastDay));
            result.add(item);
        }
        return result;
    }

    private static Integer toInt(Object value) {
        if (value instanceof Integer i) return i;
        if (value instanceof Number n) return n.intValue();
        return null;
    }

    private static Long toLong(Object value) {
        if (value instanceof Long l) return l;
        if (value instanceof Number n) return n.longValue();
        return null;
    }
}
