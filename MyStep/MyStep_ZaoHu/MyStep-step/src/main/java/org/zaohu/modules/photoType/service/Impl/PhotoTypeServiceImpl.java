package org.zaohu.modules.photoType.service.Impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.zaohu.common.entity.PhotoBatch;
import org.zaohu.constant.Constant;
import org.zaohu.jobs.rocketMq.producer.RocketMQTemplateProducerUtils;
import org.zaohu.modules.photo.entity.Photo;
import org.zaohu.modules.photo.mapper.PhotoMapper;
import org.zaohu.modules.photoType.entity.PhotoType;
import org.zaohu.modules.photoType.mapper.PhotoTypeMapper;
import org.zaohu.modules.photoType.service.PhotoTypeService;
import org.zaohu.utils.FileUtils;
import org.zaohu.utils.text.StringUtils;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
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
    @Autowired
    private PhotoMapper photoMapper;
    @Autowired
    private RocketMQTemplateProducerUtils rocketMQTemplateProducerUtils;

    @Override
    public void addPhotoType(PhotoType photoType) {
        String photoPath = FileUtils.uploadPhotoImage(photoType.getTempPhoto(), Constant.PHOTO_TYPE_PATH);
        photoType.setMainPhoto(photoPath);
        photoTypeMapper.insert(photoType);
    }

    @Override
    public List<PhotoType> getPhotoType(PhotoType photoType, Integer isPhrase) {
        QueryWrapper<PhotoType> photoTypeQw = new QueryWrapper<>();
        String typeName = photoType.getTypeName();
        if (StringUtils.isNotBlank(typeName)) {
            photoTypeQw.lambda().like(true, PhotoType::getTypeName, typeName);
        }
        photoTypeQw.lambda().orderByAsc(PhotoType::getSortOrder);
        List<PhotoType> photoTypes = photoTypeMapper.selectList(photoTypeQw);

        //接下来查出里面照片设置的短语
        if (isPhrase.equals(1) && !photoTypes.isEmpty()) {
            getPhraseByTypeId(photoTypes);
        }
        return photoTypes;
    }

    private void getPhraseByTypeId(List<PhotoType> photoTypes) {
        ArrayList<Integer> typeId = new ArrayList<>();
        for (PhotoType type : photoTypes) {
            typeId.add(type.getId());
        }
        ArrayList<Photo> photoPhrases = photoMapper.selectPhraseByTypeId(typeId);
        HashMap<Integer, ArrayList<String>> typePhrase = new HashMap<>();
        for (Photo photo : photoPhrases) {
            // 如果typeId不存在，会自动创建列表并放入Map，再返回引用
            typePhrase.computeIfAbsent(photo.getTypeId(), k -> new ArrayList<>())
                    .add(photo.getPhrase());
        }
        for (PhotoType type : photoTypes) {
            type.setPhrases(typePhrase.get(type.getId()));
        }
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
        String photoPath = FileUtils.uploadPhotoImage(photoType.getTempPhoto(), Constant.PHOTO_TYPE_PATH);
        photoType.setMainPhoto(photoPath);
        photoTypeMapper.updateById(photoType);
    }

    @Override
    public void addPhotoBatch(PhotoBatch photoBatch) {
        List<MultipartFile> photoTypeList = photoBatch.getPhotoTypeList();
        LocalDate currentDate = LocalDate.now(); // 当前日期
        String year = String.valueOf(currentDate.getYear());

        //一个个文件塞给mq
        for (MultipartFile multipartFile : photoTypeList) {
            // 先上传原图到Temp，返回的路径时
            String path = FileUtils.uploadPhotoImage(multipartFile, Constant.PHOTO_TYPE_TEMP_PATH);
            String[] split = path.split("/");
            String fileName = split[split.length - 1];

            // 拼接最终的文件路径
            String photoPath = Constant.FILE_PATH + year + Constant.PHOTO_TYPE_TEMP_PATH;
            String fullPath = photoPath + fileName;

            // 拼接完整文件路径，发送消息给 RocketMQ
            rocketMQTemplateProducerUtils.asyncSendMessage(Constant.ROCKET_IMAGE_THUMB_TOPIC, fullPath);
        }
        System.out.println();
    }
}
