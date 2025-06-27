package org.zaohu.common.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;
import org.zaohu.modules.photo.entity.Photo;

/**
 * @author myStep
 * @since 2025/6/28
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PhotoNew {
    private Photo photo;
    private MultipartFile file;
}
