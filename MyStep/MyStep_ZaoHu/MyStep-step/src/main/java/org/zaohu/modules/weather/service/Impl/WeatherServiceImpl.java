package org.zaohu.modules.weather.service.Impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.zaohu.modules.type.entity.Type;
import org.zaohu.modules.weather.entity.Weather;
import org.zaohu.modules.weather.entity.vo.WeatherVO;
import org.zaohu.modules.weather.mapper.WeatherMapper;
import org.zaohu.modules.weather.service.WeatherService;
import org.zaohu.utils.FileUtils;

import java.util.Objects;

/**
 * <p>
 * 天气表 服务实现类
 * </p>
 *
 * @author 铁汉柔情
 * @since 2025-12-23 11:11:34
 */
@Service
@RequiredArgsConstructor
public class WeatherServiceImpl extends ServiceImpl<WeatherMapper, Weather> implements WeatherService {
private final WeatherMapper weatherMapper;
    @Override
    public void addOrUpdateSynthesis(WeatherVO weatherVo) {
        Weather weather = new Weather();
        BeanUtil.copyProperties(weatherVo, weather);
        MultipartFile iconFile = weatherVo.getIconFile();
        if (Objects.nonNull(iconFile) && !iconFile.isEmpty()) {
            String iconPath = FileUtils.uploadImage(iconFile);
            if (!iconPath.isEmpty()) {
                weather.setIcon(iconPath);
            }
        }
        weatherMapper.insertOrUpdate(weather);
    }
}
