package org.zaohu.modules.photoType.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.time.LocalDateTime;
import java.util.ArrayList;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

/**
 * <p>
 * 照片类型表，用于分类照片（如风景、人像等）
 * </p>
 *
 * @author zaohu
 * @since 2025-06-01 15:04:57
 */
@Getter
@Setter
@TableName("photo_type")
public class PhotoType {

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    private String typeName;

    private String phrase;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime updateTime;

    private Integer photoCount;

    private Integer favoriteCount;

    private Integer sortOrder;

    private Boolean isHidden;

    private String mainPhoto;

    @TableField(exist = false)
    private MultipartFile tempPhoto;

    @TableField(exist = false)
    private ArrayList<String> phrases;
}
