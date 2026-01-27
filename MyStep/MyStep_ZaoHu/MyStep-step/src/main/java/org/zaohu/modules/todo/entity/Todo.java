package org.zaohu.modules.todo.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.time.LocalDateTime;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
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
@ApiModel(value = "Todo对象", description = "待办表")
public class Todo {

    @ApiModelProperty("主键ID")
      @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("代办内容")
    @TableField("content")
    private String content;

    @ApiModelProperty("是否完成")
    @TableField("is_done")
    private Boolean isDone;

    @ApiModelProperty("展示顺序")
    @TableField("sort_no")
    private Integer sortNo;

    @ApiModelProperty("分类：1开发，2生活")
    @TableField("type_id")
    private Integer typeId;

    @ApiModelProperty("补充信息")
    @TableField("extra_info")
    private String extraInfo;

    @ApiModelProperty("创建时间")
      @TableField(value = "create_time", fill = FieldFill.INSERT)
    private LocalDateTime createTime;
}
