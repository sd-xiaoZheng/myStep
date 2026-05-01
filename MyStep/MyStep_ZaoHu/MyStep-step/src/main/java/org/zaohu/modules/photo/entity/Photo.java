package org.zaohu.modules.photo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

/**
 * <p>
 * 照片信息表
 * </p>
 *
 * @author zaohu
 * @since 2025-05-30 20:49:25
 */
@Getter
@Setter
@TableName("photo")
public class Photo {

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @TableField("name")
    private String name;

    @TableField("file_path")
    private String filePath;

    @TableField("type_id")
    private Integer typeId;

    @TableField("is_favorite")
    private Boolean isFavorite;

    @TableField("upload_time")
    private LocalDateTime uploadTime;

    @TableField("phrase")
    private String phrase;

    @TableField("memory")
    private String memory;

    @TableField("is_deleted")
    private Boolean isDeleted;

    @TableField("location")
    private String location;

    @TableField("shot_time")
    private String shotTime;

    @TableField("device")
    private String device;

    @TableField("altitude")
    private Double altitude;

    @TableField(exist = false)
    private MultipartFile tempPhoto;
}
