package org.zaohu.modules.todo.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.time.LocalDateTime;
import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 * 待办表
 * </p>
 *
 * @author 铁汉柔情
 * @since 2025-11-26 17:15:32
 */
@Getter
@Setter
@TableName("todo")
public class Todo {

      @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @TableField("content")
    private String content;

    @TableField("is_done")
    private Boolean isDone;

    @TableField("sort_no")
    private Integer sortNo;

    @TableField("type_id")
    private Integer typeId;

    @TableField("extra_info")
    private String extraInfo;

      @TableField(value = "create_time", fill = FieldFill.INSERT)
    private LocalDateTime createTime;
}
