package org.zaohu.modules.weather.mapper;

import org.zaohu.modules.weather.entity.Weather;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 天气表 Mapper 接口
 * </p>
 *
 * @author 铁汉柔情
 * @since 2025-12-23 11:11:34
 */
@Mapper
public interface WeatherMapper extends BaseMapper<Weather> {

}
