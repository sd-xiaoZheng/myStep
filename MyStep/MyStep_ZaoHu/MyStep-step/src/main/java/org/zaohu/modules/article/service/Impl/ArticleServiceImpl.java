package org.zaohu.modules.article.service.Impl;

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
public class ArticleServiceImpl extends ServiceImpl<ArticleMapper, Article> implements ArticleService {

    @Override
    public List<Article> getDairy(Article article) {
//        AssemblyConditions();
        return List.of();
    }

    @Override
    public Long selectCount(Article article) {

        return 0L;
    }
}
