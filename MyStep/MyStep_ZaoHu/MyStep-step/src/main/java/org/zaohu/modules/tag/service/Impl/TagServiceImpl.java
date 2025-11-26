package org.zaohu.modules.tag.service.Impl;

import org.zaohu.modules.tag.entity.Tag;
import org.zaohu.modules.tag.mapper.TagMapper;
import org.zaohu.modules.tag.service.TagService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 标签表 服务实现类
 * </p>
 *
 * @author 铁汉柔情
 * @since 2025-11-26 17:10:23
 */
@Service
public class TagServiceImpl extends ServiceImpl<TagMapper, Tag> implements TagService {

}
