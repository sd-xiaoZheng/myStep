package org.zaohu.common.conditionalAssembler;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.zaohu.modules.article.entity.Article;
import org.zaohu.utils.text.StringUtils;

import java.util.Objects;

/**
 * @author myStep
 * @since 2025/12/19
 **/
public class ConditionalAssembler {

    public static LambdaQueryWrapper<Article> AssemblyConditions(Article article) {
        LambdaQueryWrapper<Article> articleLambdaQueryWrapper = new LambdaQueryWrapper<>();
        if (Objects.isNull(article)) { return articleLambdaQueryWrapper; }
        if (StringUtils.isNotEmpty(article.getId())) { articleLambdaQueryWrapper.eq(Article::getId, article.getId()); }
        if (Objects.nonNull(article.getTypeId())) { articleLambdaQueryWrapper.eq(Article::getTypeId, article.getTypeId()); }
        if (StringUtils.isNotEmpty(article.getTitle())) { articleLambdaQueryWrapper.like(Article::getTitle, article.getTitle()); }
        if (StringUtils.isNotEmpty(article.getContent())) { articleLambdaQueryWrapper.like(Article::getContent, article.getContent()); }
        if (Objects.nonNull(article.getWriteTime())) { articleLambdaQueryWrapper.eq(Article::getWriteTime, article.getWriteTime()); }
        if (Objects.nonNull(article.getMemoryTime())) { articleLambdaQueryWrapper.eq(Article::getMemoryTime, article.getMemoryTime()); }
        if (Objects.nonNull(article.getWeatherId())) { articleLambdaQueryWrapper.eq(Article::getWeatherId, article.getWeatherId()); }
        if (Objects.nonNull(article.getMoodId())) { articleLambdaQueryWrapper.eq(Article::getMoodId, article.getMoodId()); }
        if (StringUtils.isNotEmpty(article.getAuthorName())) { articleLambdaQueryWrapper.eq(Article::getAuthorName, article.getAuthorName()); }
        if (StringUtils.isNotEmpty(article.getAuthorId())) { articleLambdaQueryWrapper.eq(Article::getAuthorId, article.getAuthorId()); }
        if (StringUtils.isNotEmpty(article.getAuthorAvatar())) { articleLambdaQueryWrapper.eq(Article::getAuthorAvatar, article.getAuthorAvatar()); }
        if (StringUtils.isNotEmpty(article.getColor())) { articleLambdaQueryWrapper.eq(Article::getColor, article.getColor()); }
        if (StringUtils.isNotEmpty(article.getImageUrls())) { articleLambdaQueryWrapper.like(Article::getImageUrls, article.getImageUrls()); }
        if (Objects.nonNull(article.getIsStar())) { articleLambdaQueryWrapper.eq(Article::getIsStar, article.getIsStar()); }
        if (StringUtils.isNotEmpty(article.getAddress())) { articleLambdaQueryWrapper.like(Article::getAddress, article.getAddress()); }
        return articleLambdaQueryWrapper;
    }
}
