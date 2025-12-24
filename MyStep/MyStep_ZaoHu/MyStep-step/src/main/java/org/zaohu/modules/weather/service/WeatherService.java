package org.zaohu.modules.weather.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.zaohu.modules.weather.entity.Weather;
import org.zaohu.modules.weather.entity.vo.WeatherVO;

/**
 * <p>
 * 天气表 服务类
 * </p>
 *
 * @author 铁汉柔情
 * @since 2025-12-23 11:11:34
 */
public interface WeatherService extends IService<Weather> {
    void addOrUpdateSynthesis(WeatherVO weather);
}
