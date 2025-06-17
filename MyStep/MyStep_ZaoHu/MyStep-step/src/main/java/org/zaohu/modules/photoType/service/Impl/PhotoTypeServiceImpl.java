package org.zaohu.modules.photoType.service.Impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.multipart.MultipartFile;
import org.zaohu.common.entity.FileWrapper;
import org.zaohu.common.entity.PhotoBatch;
import org.zaohu.modules.photoType.entity.PhotoType;
import org.zaohu.modules.photoType.mapper.PhotoTypeMapper;
import org.zaohu.modules.photoType.service.PhotoTypeService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.zaohu.utils.FileUtils;
import org.zaohu.utils.text.StringUtils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 照片类型表，用于分类照片（如风景、人像等） 服务实现类
 * </p>
 *
 * @author zaohu
 * @since 2025-06-01 15:04:57
 */
@Service
public class PhotoTypeServiceImpl extends ServiceImpl<PhotoTypeMapper, PhotoType> implements PhotoTypeService {
    @Autowired
    private PhotoTypeMapper photoTypeMapper;

    @Override
    public void addPhotoType(PhotoType photoType) {
        String photoPath = FileUtils.uploadPhotoImage(photoType.getTempPhoto());
        photoType.setMainPhoto(photoPath);
        photoTypeMapper.insert(photoType);
    }

    @Override
    public List<PhotoType> getPhotoType(PhotoType photoType) {
        QueryWrapper<PhotoType> photoTypeQw = new QueryWrapper<>();
        String typeName = photoType.getTypeName();
        if (StringUtils.isNotBlank(typeName)) {
            photoTypeQw.lambda().like(true, PhotoType::getTypeName, typeName);
        }
        photoTypeQw.lambda().orderByAsc(PhotoType::getSortOrder);
        return photoTypeMapper.selectList(photoTypeQw);
    }

    @Override
    public Long selectCount(PhotoType photoType) {
        QueryWrapper<PhotoType> photoTypeQw = new QueryWrapper<>();
        String typeName = photoType.getTypeName();
        if (StringUtils.isNotBlank(typeName)) {
            photoTypeQw.lambda().like(true, PhotoType::getTypeName, typeName);
        }
        return photoTypeMapper.selectCount(photoTypeQw);
    }

    @Override
    public int deleteById(Integer id) {
        return photoTypeMapper.deleteById(id);
    }

    @Override
    public void editPhotoType(PhotoType photoType) {
        String photoPath = FileUtils.uploadPhotoImage(photoType.getTempPhoto());
        photoType.setMainPhoto(photoPath);
        photoTypeMapper.updateById(photoType);
    }

    @Override
    public void addPhotoBatch(PhotoBatch photoBatch) throws IOException {
        List<MultipartFile> photoTypeList = photoBatch.getPhotoTypeList();
        List<FileWrapper> fileList = new ArrayList<>();
        for (MultipartFile file : photoTypeList) {
            FileWrapper wrapper = new FileWrapper();
            wrapper.setFilename(file.getOriginalFilename());
            wrapper.setContentType(file.getContentType());
            wrapper.setContent(file.getBytes());
            fileList.add(wrapper);
        }
        System.out.println(fileList);
    }
}
