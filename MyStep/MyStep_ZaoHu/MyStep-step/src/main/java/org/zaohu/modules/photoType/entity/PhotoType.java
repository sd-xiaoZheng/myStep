package org.zaohu.modules.photoType.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.time.LocalDateTime;
import java.util.ArrayList;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
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
@ApiModel(value = "PhotoType对象", description = "照片类型表，用于分类照片（如风景、人像等）")
public class PhotoType {

    @ApiModelProperty("类型ID")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("类型名称")
    private String typeName;

    @ApiModelProperty("短语")
    private String phrase;

    @ApiModelProperty("更新时间（格式：yyyy-MM-dd HH:mm:ss）")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime updateTime;

    @ApiModelProperty("照片数量")
    private Integer photoCount;

    @ApiModelProperty("珍藏数量")
    private Integer favoriteCount;

    @ApiModelProperty("排序")
    private Integer sortOrder;

    @ApiModelProperty("是否隐藏该类型")
    private Boolean isHidden;

    @ApiModelProperty("封面路径")
    private String mainPhoto;

    @TableField(exist = false)
    private MultipartFile tempPhoto;

    @TableField(exist = false)
    private ArrayList<String> phrases;
}
