package org.zaohu.modules.tagRelation.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 * 标签关联表
 * </p>
 *
 * @author 铁汉柔情
 * @since 2025-11-26 17:12:05
 */
@Getter
@Setter
@TableName("tag_relation")
public class TagRelation {

    private String articleId;

    @TableId("tag_id")
    private Integer tagId;
}
