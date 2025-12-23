package org.zaohu.modules.type.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zaohu.common.ResultCommon.Result;
import org.zaohu.modules.type.entity.Type;
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
        if(StringUtils.isNotEmpty(name)){
            typeLqw.like(Type::getName,name);
        }
        return Result.success(typeService.list(typeLqw));
    }
}
