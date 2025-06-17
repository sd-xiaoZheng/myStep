package org.zaohu.modules.step.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.zaohu.common.ResultCommon.Result;
import org.zaohu.modules.step.entity.FunQuestion;
import org.zaohu.modules.step.mapper.FunQuestionMapper;
import org.zaohu.modules.step.service.IFunQuestionService;

import java.util.List;

@Service
public class FunQuestionServiceImpl extends ServiceImpl<FunQuestionMapper, FunQuestion> implements IFunQuestionService {
    @Override
    public Result<?> getQuestion() {
        List<FunQuestion> funQuestions = this.baseMapper.selectList(null);
        return Result.success(funQuestions);
    }
}
