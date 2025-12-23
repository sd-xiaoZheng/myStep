package org.zaohu.modules.weather.service.Impl;

import org.zaohu.modules.weather.entity.Weather;
import org.zaohu.modules.weather.mapper.WeatherMapper;
import org.zaohu.modules.weather.service.WeatherService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 天气表 服务实现类
 * </p>
 *
 * @author 铁汉柔情
 * @since 2025-12-23 11:11:34
 */
@Service
public class WeatherServiceImpl extends ServiceImpl<WeatherMapper, Weather> implements WeatherService {

}
