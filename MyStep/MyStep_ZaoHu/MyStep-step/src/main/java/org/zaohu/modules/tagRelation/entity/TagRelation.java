package org.zaohu.modules.tagRelation.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
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
@ApiModel(value = "TagRelation对象", description = "标签关联表")
public class TagRelation {

    @ApiModelProperty("文章ID")
    private String articleId;

    @ApiModelProperty("标签ID")
    @TableId("tag_id")
    private Integer tagId;
}
