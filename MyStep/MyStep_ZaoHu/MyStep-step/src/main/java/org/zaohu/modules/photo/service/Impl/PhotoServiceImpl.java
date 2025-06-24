package org.zaohu.modules.photo.service.Impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.zaohu.modules.photo.entity.Photo;
import org.zaohu.modules.photo.mapper.PhotoMapper;
import org.zaohu.modules.photo.service.PhotoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.zaohu.modules.photoType.entity.PhotoType;

import java.util.List;

/**
 * <p>
 * 照片信息表 服务实现类
 * </p>
 *
 * @author zaohu
 * @since 2025-05-30 20:49:25
 */
@Service
public class PhotoServiceImpl extends ServiceImpl<PhotoMapper, Photo> implements PhotoService {
    @Autowired
    private PhotoMapper photoMapper;
    @Override
    public List<Photo> getPhoto(Photo photoType) {
        QueryWrapper<Photo> photoQueryWrapper = new QueryWrapper<>();
        photoQueryWrapper.lambda().eq(Photo::getTypeId, photoType.getTypeId());
        List<Photo> photos = photoMapper.selectList(photoQueryWrapper);
        return photos;
    }

    @Override
    public Long selectCount(Photo photo) {
        QueryWrapper<Photo> photoQueryWrapper = new QueryWrapper<>();
        photoQueryWrapper.lambda().eq(Photo::getTypeId, photo.getTypeId());
        return photoMapper.selectCount(photoQueryWrapper);
    }
}
