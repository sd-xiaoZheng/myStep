package org.zaohu.modules.tag.service.Impl;

import cn.hutool.core.bean.BeanUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.web.multipart.MultipartFile;
import org.zaohu.modules.mood.entity.Mood;
import org.zaohu.modules.mood.entity.vo.MoodVO;
import org.zaohu.modules.tag.entity.Tag;
import org.zaohu.modules.tag.mapper.TagMapper;
import org.zaohu.modules.tag.service.TagService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.zaohu.utils.FileUtils;

import java.util.Objects;

/**
 * <p>
 * 标签表 服务实现类
 * </p>
 *
 * @author 铁汉柔情
 * @since 2025-11-26 17:10:23
 */
@Service
@RequiredArgsConstructor
public class TagServiceImpl extends ServiceImpl<TagMapper, Tag> implements TagService {

    private final TagMapper tagMapper;

}
