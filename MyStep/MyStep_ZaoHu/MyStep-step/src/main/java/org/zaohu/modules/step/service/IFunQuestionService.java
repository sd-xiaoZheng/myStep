package org.zaohu.modules.step.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.zaohu.common.ResultCommon.Result;
import org.zaohu.modules.step.entity.FunQuestion;

public interface IFunQuestionService extends IService<FunQuestion> {
    Result<?> getQuestion();
}
