package org.zaohu.modules.webBug.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.zaohu.common.ResultCommon.Result;
import org.zaohu.modules.webBug.entity.BaiduQuestion;

import java.util.List;

public interface IWebBugService extends IService<BaiduQuestion> {
    Result<?> executeBug(Integer pages);

    Result<?> killMysql();

    List<BaiduQuestion> getQuestionText();

    Long selectCount();
}
