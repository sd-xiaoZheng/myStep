package org.zaohu.utils;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.zaohu.common.page.PageDomain;
import org.zaohu.common.page.TableSupport;
import org.zaohu.utils.sql.SqlUtil;

/**
 * @author My-step
 * @since 2025/6/2
 * 照搬ruoyi分页实现
 **/
public class PageUtils extends PageHelper {

    public static void startPage() {
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();
        String orderBy = SqlUtil.escapeOrderBySql(pageDomain.getOrderBy());
        Boolean reasonable = pageDomain.getReasonable();
        PageHelper.startPage(pageNum, pageSize, orderBy).setReasonable(reasonable);
    }

    public static void startPageNoCount() {
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();
        String orderBy = SqlUtil.escapeOrderBySql(pageDomain.getOrderBy());
        Boolean reasonable = pageDomain.getReasonable();
        PageHelper.startPage(pageNum, pageSize, false).setOrderBy(orderBy).setReasonable(reasonable);
    }

    /**
     * 清理分页的线程变量
     */
    public static void clearPage() {
        PageHelper.clearPage();
    }
}
