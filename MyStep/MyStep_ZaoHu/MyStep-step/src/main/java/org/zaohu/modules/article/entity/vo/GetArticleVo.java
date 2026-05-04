package org.zaohu.modules.article.entity.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.zaohu.common.entity.KeyIntegerValueObj;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GetArticleVo {
    private String startTime;//写作时间
    private String endTime;//写作时间
    private String title;//文章标题
    private String content;//文章内容
    private List<KeyIntegerValueObj> keyValueObj;//各种标签
}
