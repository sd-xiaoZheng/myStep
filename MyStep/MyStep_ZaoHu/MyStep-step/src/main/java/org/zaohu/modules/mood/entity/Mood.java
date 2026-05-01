package org.zaohu.modules.mood.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
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
public class Mood {

      @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @TableField("name")
    private String name;

    @TableField("icon")
    private String icon;
}
