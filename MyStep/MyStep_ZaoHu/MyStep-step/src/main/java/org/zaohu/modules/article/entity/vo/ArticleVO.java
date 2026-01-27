package org.zaohu.modules.article.entity.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;
import org.zaohu.modules.article.entity.Article;

import java.util.List;

/**
 * @author myStep
 * @since 2025/12/25
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ArticleVO extends Article {
    private Integer[] tagIds;
    private MultipartFile[] images;
    private List<UpdateArticleVO> updateFile;//需要更新的图片
    private String deleteImages;
}
