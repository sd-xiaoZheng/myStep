package org.zaohu.modules.article.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;
import org.zaohu.modules.tag.entity.Tag;

import java.time.LocalDateTime;
import java.util.List;

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
@ToString
public class Article {

    @TableId("id")
    private String id;

    @TableField("type_id")
    private Integer typeId;

    @TableField("title")
    private String title;

    @TableField("content")
    private String content;

    @TableField("write_time")
    private LocalDateTime writeTime;

    @TableField("memory_time")
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime memoryTime;

    @TableField("weather_id")
    private Integer weatherId;

    @TableField("mood_id")
    private Integer moodId;

    @TableField("author_name")
    private String authorName;

    @TableField("author_id")
    private Long authorId;

    @TableField("author_avatar")
    private String authorAvatar;

    @TableField("color")
    private String color;

    @TableField("image_urls")
    private String imageUrls;

    @TableField("is_star")
    private Boolean isStar;

    @TableField("address")
    private String address;

    @TableField(exist = false)
    private String typeName;

    @TableField(exist = false)
    private String weatherName;

    @TableField(exist = false)
    private String moodName;

    @TableField(exist = false)
    private List<Tag> tags;
}
