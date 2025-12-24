package org.zaohu.modules.type.entity;

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
 * 类型表
 * </p>
 *
 * @author 铁汉柔情
 * @since 2025-11-26 17:15:53
 */
@Getter
@Setter
@TableName("type")
@ApiModel(value = "Type对象", description = "类型表")
public class Type {

    @ApiModelProperty("主键ID")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("类型名称")
    @TableField("name")
    private String name;

    @ApiModelProperty("类型图标路径或URL")
    @TableField("icon")
    private String icon;

    @ApiModelProperty("展示顺序")
    @TableField("sort_no")
    private Integer sortNo;
}
