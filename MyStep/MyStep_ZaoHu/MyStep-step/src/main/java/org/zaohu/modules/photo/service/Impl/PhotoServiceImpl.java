package org.zaohu.modules.photo.service.Impl;

import org.zaohu.modules.photo.entity.Photo;
import org.zaohu.modules.photo.mapper.PhotoMapper;
import org.zaohu.modules.photo.service.PhotoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

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

}
