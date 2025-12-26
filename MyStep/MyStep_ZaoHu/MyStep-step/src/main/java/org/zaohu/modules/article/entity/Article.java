package org.zaohu.modules.article.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

/**
 * <p>
 * 文章表
 * </p>
 *
 * @author tiehanrouqing
 * @since 2025-11-26 16:59:59
 */
@Getter
@Setter
@TableName("article")
@ApiModel(value = "Article对象", description = "文章表")
@ToString
public class Article {

    @ApiModelProperty("文章ID")
    @TableId("id")
    private String id;

    @ApiModelProperty("类型ID")
    @TableField("type_id")
    private Integer typeId;

    @ApiModelProperty("标题")
    @TableField("title")
    private String title;

    @ApiModelProperty("内容")
    @TableField("content")
    private String content;

    @ApiModelProperty("写作时间")
    @TableField("write_time")
    private LocalDateTime writeTime;

    @ApiModelProperty("记忆中的时间")
    @TableField("memory_time")
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime memoryTime;

    @ApiModelProperty("天气ID")
    @TableField("weather_id")
    private Integer weatherId;

    @ApiModelProperty("心情ID")
    @TableField("mood_id")
    private Integer moodId;

    @ApiModelProperty("写作者名称")
    @TableField("author_name")
    private String authorName;

    @ApiModelProperty("写作者ID")
    @TableField("author_id")
    private Long authorId;

    @ApiModelProperty("写作者头像")
    @TableField("author_avatar")
    private String authorAvatar;

    @ApiModelProperty("展示颜色")
    @TableField("color")
    private String color;

    @ApiModelProperty("图片地址，逗号分割")
    @TableField("image_urls")
    private String imageUrls;

    @ApiModelProperty("是否星标")
    @TableField("is_star")
    private Boolean isStar;

    @ApiModelProperty("发生地址")
    @TableField("address")
    private String address;

    @TableField(exist = false)
    private String typeName;

    @TableField(exist = false)
    private String weatherName;

    @TableField(exist = false)
    private String moodName;


}
