package org.zaohu.modules.photoType.service.Impl;

import cn.hutool.core.date.LocalDateTimeUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.drew.imaging.ImageProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.zaohu.common.entity.PhotoBatch;
import org.zaohu.common.entity.PhotoNew;
import org.zaohu.constant.Constant;
import org.zaohu.jobs.rocketMq.producer.RocketMQTemplateProducerUtils;
import org.zaohu.modules.photo.entity.Photo;
import org.zaohu.modules.photo.mapper.PhotoMapper;
import org.zaohu.modules.photoType.entity.PhotoType;
import org.zaohu.modules.photoType.mapper.PhotoTypeMapper;
import org.zaohu.modules.photoType.service.PhotoTypeService;
import org.zaohu.utils.FileUtils;
import org.zaohu.utils.photoutils.PhotoInfo;
import org.zaohu.utils.text.StringUtils;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Objects;

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

    /**
     * @param photoType
     * @param isPhrase  是否获取里面的短语 因为是获取短语 所以是生命瞬间页面不是管理页面 所以不能展示隐藏的
     * @return
     */
    @Override
    public List<PhotoType> getPhotoType(PhotoType photoType, Integer isPhrase) {
        QueryWrapper<PhotoType> photoTypeQw = new QueryWrapper<>();
        String typeName = photoType.getTypeName();
        if (StringUtils.isNotBlank(typeName)) {
            photoTypeQw.lambda().like(true, PhotoType::getTypeName, typeName);
        }
        Boolean isHidden = photoType.getIsHidden();
        if (Objects.nonNull(isHidden) && isHidden) {
            photoTypeQw.lambda().eq(PhotoType::getIsHidden, photoType.getIsHidden());
        }

        photoTypeQw.lambda().orderByAsc(PhotoType::getSortOrder);
        List<PhotoType> photoTypes = photoTypeMapper.selectList(photoTypeQw);

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
        MultipartFile tempPhoto = photoType.getTempPhoto();
        if (Objects.nonNull(tempPhoto)) {
            String photoPath = FileUtils.uploadPhotoImage(tempPhoto, Constant.PHOTO_TYPE_PATH);
            photoType.setMainPhoto(photoPath);
        }
        photoTypeMapper.updateById(photoType);
    }

    @Override
    public void addPhotoBatch(PhotoBatch photoBatch) throws ImageProcessingException, IOException {
        List<MultipartFile> photoTypeList = photoBatch.getPhotoTypeList();
        ArrayList<Photo> addBatchList = new ArrayList<>();
        LocalDate currentDate = LocalDate.now();
        String year = String.valueOf(currentDate.getYear());
        String month = String.format("%02d", currentDate.getMonthValue());
        for (MultipartFile multipartFile : photoTypeList) {
            Photo photo = processAndBuildPhoto(multipartFile, photoBatch.getTypeId(), year, month);
            addBatchList.add(photo);
        }
        photoMapper.insert(addBatchList);
    }

    @Override
    public void addPhoto(PhotoNew photoNew) throws ImageProcessingException, IOException {
        MultipartFile file = photoNew.getFile();
        Photo photo = photoNew.getPhoto();

        LocalDate currentDate = LocalDate.now();
        String year = String.valueOf(currentDate.getYear());
        String month = String.format("%02d", currentDate.getMonthValue());

        Photo processedPhoto = processAndBuildPhoto(file, photo.getTypeId(), year, month);
        photo.setFilePath(processedPhoto.getFilePath());
        photo.setUploadTime(processedPhoto.getUploadTime());
        photo.setUploadTime(LocalDateTimeUtil.now());
        photo.setLocation(processedPhoto.getLocation());
        photo.setShotTime(processedPhoto.getShotTime());
        photo.setDevice(processedPhoto.getDevice());
        photo.setAltitude(processedPhoto.getAltitude());
        photoMapper.insert(photo);
    }

    /**
     * 处理这张照片原图保存temp 推给mq转缩略webp
     *
     * @param file 上传的文件
     * @param typeId 类型id
     * @param year 年
     * @param month 月
     * @return
     * @throws IOException
     * @throws ImageProcessingException
     */
    private Photo processAndBuildPhoto(MultipartFile file, Integer typeId, String year, String month)
            throws IOException, ImageProcessingException {

        String path = FileUtils.uploadPhotoImage(file, Constant.PHOTO_TYPE_TEMP_PATH);
        String[] split = path.split("/");
        String fileName = split[split.length - 1];

        String photoPath = Constant.FILE_PATH + year + Constant.PHOTO_TYPE_TEMP_PATH;
        String fullPath = photoPath + fileName;

        rocketMQTemplateProducerUtils.asyncSendMessage(Constant.ROCKET_IMAGE_THUMB_TOPIC, fullPath);

        Photo photo = new Photo();
        int dotIndex = fileName.lastIndexOf('.');
        String extension = dotIndex >= 0 ? fileName.substring(dotIndex) : "";
        if (!extension.isEmpty()) {
            fileName = fileName.substring(0, dotIndex) + ".webp";
        } else {
            fileName += ".webp";
        }

        photo.setName(fileName);
        photo.setTypeId(typeId);
        photo.setUploadTime(LocalDateTimeUtil.now());
        photo.setFilePath(Constant.RESOURCE_PREFIX.replace("/step", "") + year + Constant.PHOTO_PATH + month + "/" + fileName);

        File imageFile = new File(Constant.FILE_PATH + path.replace("/Zaohu", ""));
        //获取照片的信息
        PhotoInfo.getPhotoInfo(imageFile, photo);
        return photo;
    }
}
