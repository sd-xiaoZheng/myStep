package org.zaohu.common.entity;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;
import org.zaohu.modules.photoType.entity.PhotoType;

import java.util.List;

/**
 * @author My-step
 * @since 2025/6/11
 **/
@Data
public class PhotoBatch {
    private List<MultipartFile> photoTypeList;
    private Integer typeId;
}
