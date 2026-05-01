package org.zaohu.modules.tag.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
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
public class Tag {

      @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @TableField("name")
    private String name;

    @TableField("color")
    private String color;

    @TableField("sort_no")
    private Integer sortNo;
}
