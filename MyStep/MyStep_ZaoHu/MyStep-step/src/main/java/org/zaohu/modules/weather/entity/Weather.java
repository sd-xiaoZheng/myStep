package org.zaohu.modules.weather.entity;

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
 * 天气表
 * </p>
 *
 * @author 铁汉柔情
 * @since 2025-12-23 11:11:34
 */
@Getter
@Setter
@TableName("weather")
@ApiModel(value = "Weather对象", description = "天气表")
public class Weather {

    @ApiModelProperty("主键ID")
      @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("天气描述")
    @TableField("label")
    private String label;

    @ApiModelProperty("天气图标路径或URL")
    @TableField("icon")
    private String icon;
}
