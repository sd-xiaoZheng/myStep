package org.zaohu.modules.article.service.Impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import lombok.RequiredArgsConstructor;
import org.zaohu.common.conditionalAssembler.ConditionalAssembler;
import org.zaohu.modules.article.entity.Article;
import org.zaohu.modules.article.mapper.ArticleMapper;
import org.zaohu.modules.article.service.ArticleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

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

    @Override
    public List<Article> getDairy(Article article) {
        //这里要从es中查询 目前先再mysql中查询
        LambdaQueryWrapper<Article> articleLqWrapper = ConditionalAssembler.AssemblyConditions(article);
        return  articleMapper.selectList(articleLqWrapper);
    }

    @Override
    public Long selectCount(Article article) {
        return articleMapper.selectCount(null);
    }
}
