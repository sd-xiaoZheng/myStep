package org.zaohu.modules.mood.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.zaohu.common.ResultCommon.Result;
import org.zaohu.modules.mood.entity.Mood;
import org.zaohu.modules.mood.entity.vo.MoodVO;
import org.zaohu.modules.mood.service.MoodService;
import org.zaohu.modules.weather.entity.Weather;
import org.zaohu.modules.weather.entity.vo.WeatherVO;
import org.zaohu.modules.weather.service.WeatherService;
import org.zaohu.utils.text.StringUtils;

/**
 * <p>
 * 心情表 前端控制器
 * </p>
 *
 * @author 铁汉柔情
 * @since 2025-11-26 17:06:14
 */
@RestController
@RequestMapping("/step/mood")
@RequiredArgsConstructor
public class MoodController {
    private final MoodService moodService;

    @GetMapping("/list")
    public Result typeList(MoodVO moodVO) {
        LambdaQueryWrapper<Mood> typeLqw = new LambdaQueryWrapper<>();
        String name = moodVO.getName();
        if (StringUtils.isNotEmpty(name)) {
            typeLqw.like(Mood::getName, name);
        }
        return Result.success(moodService.list(typeLqw));
    }

    @PostMapping("/update")
    public Result update(@ModelAttribute MoodVO moodVO) {
        moodService.addOrUpdateSynthesis(moodVO);
        return Result.success();
    }

    @PostMapping("/add")
    public Result add(@ModelAttribute MoodVO moodVO) {
        moodService.addOrUpdateSynthesis(moodVO);
        return Result.success();
    }
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id) {
        moodService.removeById(id);
        return Result.success();
    }
}
