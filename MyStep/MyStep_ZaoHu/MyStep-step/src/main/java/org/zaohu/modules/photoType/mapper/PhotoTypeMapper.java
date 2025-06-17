package org.zaohu.modules.photoType.mapper;

import org.zaohu.modules.photoType.entity.PhotoType;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 照片类型表，用于分类照片（如风景、人像等） Mapper 接口
 * </p>
 *
 * @author zaohu
 * @since 2025-06-01 15:04:57
 */
@Mapper
public interface PhotoTypeMapper extends BaseMapper<PhotoType> {

}
