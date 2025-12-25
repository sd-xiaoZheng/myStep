package org.zaohu.modules.tag.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.zaohu.common.ResultCommon.Result;
import org.zaohu.modules.mood.entity.Mood;
import org.zaohu.modules.mood.entity.vo.MoodVO;
import org.zaohu.modules.mood.service.MoodService;
import org.zaohu.modules.tag.entity.Tag;
import org.zaohu.modules.tag.service.TagService;
import org.zaohu.utils.text.StringUtils;

/**
 * <p>
 * 标签表 前端控制器
 * </p>
 *
 * @author 铁汉柔情
 * @since 2025-11-26 17:10:23
 */
@RestController
@RequestMapping("/step/tag")
@RequiredArgsConstructor
public class TagController {
    private final TagService tagService;

    @GetMapping("/list")
    public Result typeList(Tag tag) {
        LambdaQueryWrapper<Tag> typeLqw = new LambdaQueryWrapper<>();
        String name = tag.getName();
        if (StringUtils.isNotEmpty(name)) {
            typeLqw.like(Tag::getName, name);
        }
        return Result.success(tagService.list(typeLqw));
    }

    @PostMapping("/update")
    public Result update(@RequestBody Tag tag) {
        tagService.saveOrUpdate(tag);
        return Result.success();
    }

    @PostMapping("/add")
    public Result add(@RequestBody Tag tag) {
        tagService.saveOrUpdate(tag);
        return Result.success();
    }
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id) {
        tagService.removeById(id);
        return Result.success();
    }
}
