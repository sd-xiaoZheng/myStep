package org.zaohu.modules.weather.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.zaohu.common.ResultCommon.Result;
import org.zaohu.modules.weather.entity.Weather;
import org.zaohu.modules.weather.entity.vo.WeatherVO;
import org.zaohu.modules.weather.service.WeatherService;
import org.zaohu.utils.text.StringUtils;

/**
 * <p>
 * 天气表 前端控制器
 * </p>
 *
 * @author 铁汉柔情
 * @since 2025-12-23 11:11:34
 */
@RestController
@RequestMapping("/step/weather")
@RequiredArgsConstructor
public class WeatherController {
    private final WeatherService weatherService;

    @GetMapping("/list")
    public Result typeList(WeatherVO weather) {
        LambdaQueryWrapper<Weather> typeLqw = new LambdaQueryWrapper<>();
        String label = weather.getLabel();
        if (StringUtils.isNotEmpty(label)) {
            typeLqw.like(Weather::getLabel, label);
        }
        return Result.success(weatherService.list(typeLqw));
    }

    @PostMapping("/update")
    public Result update(@ModelAttribute WeatherVO weather) {
        weatherService.addOrUpdateSynthesis(weather);
        return Result.success();
    }

    @PostMapping("/add")
    public Result add(@ModelAttribute WeatherVO weather) {
        weatherService.addOrUpdateSynthesis(weather);
        return Result.success();
    }

    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id) {
        weatherService.removeById(id);
        return Result.success();
    }
}
