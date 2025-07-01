package org.zaohu.modules.photo.service;

import com.drew.imaging.ImageProcessingException;
import org.zaohu.modules.photo.entity.Photo;
import com.baomidou.mybatisplus.extension.service.IService;
import org.zaohu.modules.photoType.entity.PhotoType;

import java.io.IOException;
import java.util.List;

/**
 * <p>
 * 照片信息表 服务类
 * </p>
 *
 * @author zaohu
 * @since 2025-05-30 20:49:25
 */
public interface PhotoService extends IService<Photo> {

    List<Photo> getPhoto(Integer typeId);

    Long selectCount(Integer typeId);

    void likePhoto(Integer photoId);

    void updatePhoto(Photo photo) throws ImageProcessingException, IOException;

    void UnLikePhoto(Integer photoId);
}
