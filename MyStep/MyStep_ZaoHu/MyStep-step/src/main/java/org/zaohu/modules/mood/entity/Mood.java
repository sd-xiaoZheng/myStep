package org.zaohu.modules.mood.entity;

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
 * 心情表
 * </p>
 *
 * @author 铁汉柔情
 * @since 2025-11-26 17:06:14
 */
@Getter
@Setter
@TableName("mood")
@ApiModel(value = "Mood对象", description = "心情表")
public class Mood {

    @ApiModelProperty("主键ID")
      @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("心情名称")
    @TableField("name")
    private String name;

    @ApiModelProperty("心情表情图标路径或URL")
    @TableField("icon")
    private String icon;
}
