package org.zaohu.modules.photo.entity;

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
 * 照片信息表
 * </p>
 *
 * @author zaohu
 * @since 2025-05-30 20:49:25
 */
@Getter
@Setter
@TableName("photo")
@ApiModel(value = "Photo对象", description = "照片信息表")
public class Photo {

    @ApiModelProperty("照片主键ID，自增")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("照片名称，可选")
    @TableField("name")
    private String name;

    @ApiModelProperty("照片存放地址")
    @TableField("file_path")
    private String filePath;

    @ApiModelProperty("所属类型ID，对应类型表")
    @TableField("type_id")
    private Integer typeId;

    @ApiModelProperty("珍藏标识，TRUE为珍藏")
    @TableField("is_favorite")
    private Boolean isFavorite;

    @ApiModelProperty("上传时间，文本格式")
    @TableField("upload_time")
    private LocalDateTime uploadTime;

    @ApiModelProperty("与照片相关的短语")
    @TableField("phrase")
    private String phrase;

    @ApiModelProperty("关于照片的回忆故事内容")
    @TableField("memory")
    private String memory;

    @ApiModelProperty("回收站标识，TRUE表示已删除")
    @TableField("is_deleted")
    private Boolean isDeleted;

    @ApiModelProperty("照片拍摄地址")
    @TableField("location")
    private String location;

    @ApiModelProperty("拍摄时间，文本格式")
    @TableField("shot_time")
    private String shotTime;

    @ApiModelProperty("拍摄设备名称")
    @TableField("device")
    private String device;

    @ApiModelProperty("海拔")
    @TableField("altitude")
    private Double altitude;
}
