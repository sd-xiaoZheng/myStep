package org.zaohu.modules.webBug.controller;


import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.zaohu.common.ResultCommon.Result;
import org.zaohu.common.page.TableDataInfo;
import org.zaohu.constant.controller.BaseController;
import org.zaohu.modules.webBug.entity.BaiduQuestion;
import org.zaohu.modules.webBug.service.IWebBugService;

import java.util.List;

import static org.zaohu.utils.PageUtils.startPageNoCount;


/**
 * @author 73501
 */
@RestController
@RequestMapping("/step/WebBug")
@CrossOrigin//TODO ？什么东西
@RequiredArgsConstructor
public class WebBugController extends BaseController {
    private final IWebBugService webBugService;

    @GetMapping("/executeBug")
    public Result executeBug(@RequestParam("pages") Integer pages){
        return webBugService.executeBug(pages);
    }

    @PostMapping("/killMysql")
    public Result<?> killMysql(){
        return webBugService.killMysql();
    }

    @GetMapping("/getQuestionText")
    public Result getQuestionText(){
        startPageNoCount();
        List<BaiduQuestion> questions = webBugService.getQuestionText();
        Long total = webBugService.selectCount();
        TableDataInfo dataTable = getDataTableNoTotal(questions);
        dataTable.setTotal(total);
        return Result.success(dataTable);
    }
}
