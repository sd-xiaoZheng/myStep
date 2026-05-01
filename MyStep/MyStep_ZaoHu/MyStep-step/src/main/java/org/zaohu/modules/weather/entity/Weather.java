package org.zaohu.modules.weather.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
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
public class Weather {

      @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @TableField("label")
    private String label;

    @TableField("icon")
    private String icon;
}
