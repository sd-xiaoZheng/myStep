package org.zaohu.modules.article.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zaohu.common.page.TableDataInfo;
import org.zaohu.constant.controller.BaseController;
import org.zaohu.modules.article.entity.Article;
import org.zaohu.modules.article.service.ArticleService;

import java.util.List;


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
}
