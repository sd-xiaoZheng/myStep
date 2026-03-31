package org.zaohu.modules.article.service;

import org.zaohu.modules.article.entity.Article;
import com.baomidou.mybatisplus.extension.service.IService;
import org.zaohu.modules.article.entity.vo.ArticleVO;

import java.io.IOException;
import java.util.List;

/**
 * <p>
 * 文章表 服务类
 * </p>
 *
 * @author tiehanrouqing
 * @since 2025-11-26 16:59:59
 */
public interface ArticleService extends IService<Article> {

    List<Article> getDairy(Article article);

    Long selectCount(Article article);

    void addArticle(ArticleVO articleVO) throws IOException;

    void updateArticle(ArticleVO articleVO);

    void deleteArticle(ArticleVO articleVO);
}
