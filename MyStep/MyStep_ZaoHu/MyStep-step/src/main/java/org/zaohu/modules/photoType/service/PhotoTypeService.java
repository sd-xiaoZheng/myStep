package org.zaohu.modules.photoType.service;

import org.zaohu.common.entity.PhotoBatch;
import org.zaohu.modules.photoType.entity.PhotoType;
import com.baomidou.mybatisplus.extension.service.IService;

import java.io.IOException;
import java.util.List;

/**
 * <p>
 * 照片类型表，用于分类照片（如风景、人像等） 服务类
 * </p>
 *
 * @author zaohu
 * @since 2025-06-01 15:04:57
 */
public interface PhotoTypeService extends IService<PhotoType> {

    void addPhotoType(PhotoType photoType);

    List<PhotoType> getPhotoType(PhotoType photoType);

    Long selectCount(PhotoType photoType);

    int deleteById(Integer id);

    void editPhotoType(PhotoType photoType);

    void addPhotoBatch(PhotoBatch photoBatch) throws IOException;
}
