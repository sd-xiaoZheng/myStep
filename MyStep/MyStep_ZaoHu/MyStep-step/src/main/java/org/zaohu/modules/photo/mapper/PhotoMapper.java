package org.zaohu.modules.photo.mapper;

import org.zaohu.modules.photo.entity.Photo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.zaohu.modules.photoType.entity.PhotoType;

import java.util.ArrayList;

/**
 * <p>
 * 照片信息表 Mapper 接口
 * </p>
 *
 * @author zaohu
 * @since 2025-05-30 20:49:25
 */
@Mapper
public interface PhotoMapper extends BaseMapper<Photo> {
    ArrayList<Photo> selectPhraseByTypeId(ArrayList<Integer> typeId);
}
