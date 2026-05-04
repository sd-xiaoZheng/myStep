package org.zaohu.modules.article.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.zaohu.modules.article.entity.Article;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 * 文章表 Mapper 接口
 * </p>
 *
 * @author tiehanrouqing
 * @since 2025-11-26 16:59:59
 */
@Mapper
public interface ArticleMapper extends BaseMapper<Article> {
}
