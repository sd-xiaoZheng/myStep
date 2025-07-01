package org.zaohu.modules.photo.service.Impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.drew.imaging.ImageProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;
import org.zaohu.modules.photo.entity.Photo;
import org.zaohu.modules.photo.mapper.PhotoMapper;
import org.zaohu.modules.photo.service.PhotoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.zaohu.modules.photoType.entity.PhotoType;
import org.zaohu.modules.photoType.service.Impl.PhotoTypeServiceImpl;
import org.zaohu.modules.photoType.service.PhotoTypeService;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
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
    @Autowired
    private PhotoTypeServiceImpl photoTypeService;
    @Override
    public List<Photo> getPhoto(Integer typeId) {
        QueryWrapper<Photo> photoQueryWrapper = new QueryWrapper<>();
        photoQueryWrapper.lambda().eq(Photo::getTypeId, typeId);
        photoQueryWrapper.lambda().orderByDesc(Photo::getIsFavorite, Photo::getShotTime);
        return photoMapper.selectList(photoQueryWrapper);
    }

    @Override
    public Long selectCount(Integer typeId) {
        QueryWrapper<Photo> photoQueryWrapper = new QueryWrapper<>();
        photoQueryWrapper.lambda().eq(Photo::getTypeId, typeId);
        return photoMapper.selectCount(photoQueryWrapper);
    }

    @Override
    public void likePhoto(Integer photoId) {
        UpdateWrapper<Photo> photoUpdateWrapper = new UpdateWrapper<>();
        photoUpdateWrapper.set("is_favorite", true).eq("id", photoId);
        photoMapper.update(photoUpdateWrapper);
    }
    @Override
    public void UnLikePhoto(Integer photoId) {
        UpdateWrapper<Photo> photoUpdateWrapper = new UpdateWrapper<>();
        photoUpdateWrapper.set("is_favorite", false).eq("id", photoId);
        photoMapper.update(photoUpdateWrapper);
    }

    @Override
    public void updatePhoto(Photo photo) throws ImageProcessingException, IOException {
        MultipartFile file = photo.getTempPhoto();
        LocalDate currentDate = LocalDate.now();
        String year = String.valueOf(currentDate.getYear());
        String month = String.format("%02d", currentDate.getMonthValue());
        Photo processedPhoto = photoTypeService.processAndBuildPhoto(file, photo.getTypeId(), year, month);
        photo.setUploadTime(LocalDateTime.now());
        photo.setFilePath(processedPhoto.getFilePath());
        photoMapper.updateById(photo);
    }
}
