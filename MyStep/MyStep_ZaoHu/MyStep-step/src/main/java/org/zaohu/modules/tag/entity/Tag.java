package org.zaohu.modules.tag.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 * 标签表
 * </p>
 *
 * @author 铁汉柔情
 * @since 2025-11-26 17:10:23
 */
@Getter
@Setter
@TableName("tag")
@ApiModel(value = "Tag对象", description = "标签表")
public class Tag {

    @ApiModelProperty("主键ID")
      @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("标签名称")
    @TableField("name")
    private String name;

    @ApiModelProperty("展示颜色")
    @TableField("color")
    private String color;

    @ApiModelProperty("展示顺序")
    @TableField("sort_no")
    private Integer sortNo;
}
