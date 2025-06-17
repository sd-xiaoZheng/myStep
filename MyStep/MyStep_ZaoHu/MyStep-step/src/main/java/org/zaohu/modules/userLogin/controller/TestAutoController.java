package org.zaohu.modules.userLogin.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zaohu.common.ResultCommon.Result;

/**
 * 角色：粗粒度控制 一般控制左侧菜单
 * 角色权限：细粒度控制 一般控制页面的按钮
 * @author Zaohu
 * @since 2024/12/24
 **/
@RestController
public class TestAutoController {

    @GetMapping("test1")
    public Result test1() {
        return Result.success("不需要登录/匿名访问 test1");
    }

    @GetMapping("test2")
    public Result test2() {
        return Result.success("登录后可以访问 test2");
    }

    @PreAuthorize(value = "hasRole('admin')")
    @GetMapping("test3")
    public Result test3() {
        return Result.success("有admin角色访问 test3");
    }

    @PreAuthorize(value = "hasAnyRole('cfo','cto')")
    @GetMapping("test4")
    public Result test4() {
        return Result.success("有cto或cfo角色访问 test4");
    }

    @PreAuthorize(value = "hasRole('cfo') and hasRole('cto')")
    @GetMapping("test5")
    public Result test5() {
        return Result.success("有cto和cfo角色访问 test5");
    }

    @PreAuthorize(value = "hasAuthority('del')")
    @GetMapping("test6")
    public Result test6() {
        return Result.success("有del权限访问 test6");
    }

    @PreAuthorize(value = "hasAnyAuthority('del','edit')")
    @GetMapping("test7")
    public Result test7() {
        return Result.success("有del权限或者Edit权限访问 test7");
    }

    @PreAuthorize(value = "hasAuthority('del') and hasAuthority('edit')")
    @GetMapping("test8")
    public Result test8() {
        return Result.success("有del权限和Edit权限访问 test8");
    }
}
