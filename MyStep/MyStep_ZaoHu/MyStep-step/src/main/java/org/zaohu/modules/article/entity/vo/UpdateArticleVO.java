package org.zaohu.modules.article.entity.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author myStep
 * @since 2026/1/4
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UpdateArticleVO {
    private String oldUrl;
    private MultipartFile newImages;
}
