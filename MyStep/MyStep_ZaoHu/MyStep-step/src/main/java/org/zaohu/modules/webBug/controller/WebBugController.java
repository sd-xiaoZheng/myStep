package org.zaohu.modules.webBug.controller;


import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.zaohu.common.ResultCommon.Result;
import org.zaohu.modules.webBug.service.IWebBugService;


/**
 * @author 73501
 */
@RestController
@RequestMapping("/step/WebBug")
@CrossOrigin//TODO ？什么东西
@RequiredArgsConstructor
public class WebBugController {
    private final IWebBugService webBugService;

    @GetMapping("/executeBug")
    public Result executeBug(@RequestParam("pages") Integer pages){
        return webBugService.executeBug(pages);
    }

    @PostMapping("/killMysql")
    public Result<?> killMysql(){
        return webBugService.killMysql();
    }
}
