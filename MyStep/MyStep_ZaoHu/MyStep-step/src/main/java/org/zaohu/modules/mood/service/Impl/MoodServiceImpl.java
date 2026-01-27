package org.zaohu.modules.mood.service.Impl;

import cn.hutool.core.bean.BeanUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.web.multipart.MultipartFile;
import org.zaohu.modules.mood.entity.Mood;
import org.zaohu.modules.mood.entity.vo.MoodVO;
import org.zaohu.modules.mood.mapper.MoodMapper;
import org.zaohu.modules.mood.service.MoodService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.zaohu.modules.weather.entity.Weather;
import org.zaohu.utils.FileUtils;

import java.util.Objects;

/**
 * <p>
 * 心情表 服务实现类
 * </p>
 *
 * @author 铁汉柔情
 * @since 2025-11-26 17:06:14
 */
@Service
@RequiredArgsConstructor
public class MoodServiceImpl extends ServiceImpl<MoodMapper, Mood> implements MoodService {

    private final MoodMapper moodMapper;

    @Override
    public void addOrUpdateSynthesis(MoodVO moodVO) {
        Mood mood = new Mood();
        BeanUtil.copyProperties(moodVO, mood);
        MultipartFile iconFile = moodVO.getIconFile();
        if (Objects.nonNull(iconFile) && !iconFile.isEmpty()) {
            String iconPath = FileUtils.uploadImage(iconFile);
            if (!iconPath.isEmpty()) {
                mood.setIcon(iconPath);
            }
        }
        moodMapper.insertOrUpdate(mood);
    }
}
