package org.zaohu.modules.type.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
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
public class Type {

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @TableField("name")
    private String name;

    @TableField("icon")
    private String icon;

    @TableField("sort_no")
    private Integer sortNo;
}
