package org.zaohu.modules.article.service.Impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.zaohu.common.conditionalAssembler.ConditionalAssembler;
import org.zaohu.modules.article.entity.Article;
import org.zaohu.modules.article.entity.vo.ArticleVO;
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

import java.time.LocalDateTime;
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
    public void addArticle(ArticleVO articleVO) {
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
            //添加到es
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
        articleMapper.insertOrUpdate(article);
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
                    }
                } else {
                    FileUtils.deleteImage(imageUrls);
                }
            }
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
}
