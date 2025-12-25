package org.zaohu.modules.type.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.zaohu.common.ResultCommon.Result;
import org.zaohu.modules.type.entity.Type;
import org.zaohu.modules.type.entity.vo.TypeVO;
import org.zaohu.modules.type.service.TypeService;
import org.zaohu.utils.text.StringUtils;

/**
 * <p>
 * 类型表 前端控制器
 * </p>
 *
 * @author 铁汉柔情
 * @since 2025-11-26 17:15:53
 */
@RestController
@RequestMapping("/step/type")
public class TypeController {
    @Autowired
    private TypeService typeService;

    @GetMapping("/list")
    public Result typeList(Type type) {
        LambdaQueryWrapper<Type> typeLqw = new LambdaQueryWrapper<>();
        String name = type.getName();
        if (StringUtils.isNotEmpty(name)) {
            typeLqw.like(Type::getName, name);
        }
        typeLqw.orderByAsc(true, Type::getSortNo);
        return Result.success(typeService.list(typeLqw));
    }

    @PostMapping("/update")
    public Result update(@ModelAttribute TypeVO typeVO) {
        typeService.addOrUpdateSynthesis(typeVO);
        return Result.success();
    }

    @PostMapping("/add")
    public Result add(@ModelAttribute TypeVO typeVO) {
        typeService.addOrUpdateSynthesis(typeVO);
        return Result.success();
    }

    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id) {
        typeService.removeById(id);
        return Result.success();
    }
}
