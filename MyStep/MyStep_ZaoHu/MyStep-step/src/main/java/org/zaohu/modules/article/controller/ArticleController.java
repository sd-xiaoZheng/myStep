package org.zaohu.modules.article.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.zaohu.common.ResultCommon.Result;
import org.zaohu.common.page.TableDataInfo;
import org.zaohu.constant.controller.BaseController;
import org.zaohu.modules.article.entity.Article;
import org.zaohu.modules.article.entity.vo.ArticleVO;
import org.zaohu.modules.article.entity.vo.GetArticleVo;
import org.zaohu.modules.article.service.ArticleService;

import java.io.IOException;
import java.util.List;
import java.util.Map;


/**
 * <p>
 * 文章表 前端控制器
 * </p>
 *
 * @author tiehanrouqing
 * @since 2025-11-26 16:59:59
 */
@RestController
@RequestMapping("/step/article")
public class ArticleController extends BaseController {
    @Autowired
    private ArticleService articleService;

    @GetMapping("/getDairy")
    public TableDataInfo getDairy(Article article) {
        startPageNoCount();
        List<Article> photoList = articleService.getDairy(article);
        Long total = articleService.selectCount(article);
        TableDataInfo dataTable = getDataTableNoTotal(photoList);
        dataTable.setTotal(total);
        return dataTable;
    }

    @PostMapping("/addArticle")
    public Result addArticle(@ModelAttribute ArticleVO articleVO) throws IOException {
        articleService.addArticle(articleVO);
        return Result.success();
    }

    @PostMapping("/updateArticle")
    public Result updateArticle(@ModelAttribute ArticleVO articleVO) {
        articleService.updateArticle(articleVO);
        return Result.success();
    }

    @PostMapping("/deleteArticle")
    public Result deleteArticle(@RequestBody ArticleVO articleVO) {
        articleService.deleteArticle(articleVO);
        return Result.success();
    }

    @GetMapping("getFiltter")
    public Result getFiltter() {
        Map<String, Object> filtter = articleService.getFiltter();
        return Result.success(filtter);
    }

    @PostMapping("getArticleByFiltter")
    public Result getArticleByFiltter(@RequestBody GetArticleVo getArticleVo) {
        List<Article> photoList = articleService.getArticleByFiltter(getArticleVo);
        return Result.success(photoList);
    }

    @GetMapping("/getYearlyActivity")
    public Result getYearlyActivity(String startTime, String endTime) {
        List<Map<String, Object>> activity = articleService.getYearlyActivity(startTime, endTime);
        return Result.success(activity);
    }
}