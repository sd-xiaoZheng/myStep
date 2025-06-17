package org.zaohu.modules.webBug.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.zaohu.utils.webBugUtils.webMagic.WebMagicUtils;
import org.zaohu.common.ResultCommon.Result;
import org.zaohu.modules.webBug.entity.BaiduQuestion;
import org.zaohu.modules.webBug.mapper.WebBugMapper;
import org.zaohu.modules.webBug.service.IWebBugService;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Function;

@Service
public class WebBugServiceImpl extends ServiceImpl<WebBugMapper, BaiduQuestion> implements IWebBugService {

    /**
     * 获取几页的数据
     * @param pages
     * @return
     */
    @Override
    public Result<?> executeBug(Integer pages) {
        ArrayList<BaiduQuestion> questList = new ArrayList<>();
        for (Integer i = 0,j=0; i < pages; i++) {
            List<String> strings = WebMagicUtils.executeBug(j);
            for (String string : strings) {
                if (string.endsWith("？")){
                    BaiduQuestion baiduQuestion = new BaiduQuestion();
                    baiduQuestion.setId(Long.parseLong(Integer.toString(string.hashCode())));
                    baiduQuestion.setQuestionText(string);
                    questList.add(baiduQuestion);
                }
            }
            j+=50;
        }

        //防重
        QueryWrapper<BaiduQuestion> baiduQuestionQueryWrapper = new QueryWrapper<>();
        baiduQuestionQueryWrapper.lambda()
                .select(BaiduQuestion::getId);
        List<BaiduQuestion> baiduQuestions = this.baseMapper.selectList(baiduQuestionQueryWrapper);
        List idList = new ArrayList<>();
        idList = baiduQuestions
                .stream()
                .map((Function<BaiduQuestion, Object>) BaiduQuestion::getId)
                .toList();
        ArrayList<BaiduQuestion> notRepeat = new ArrayList<>();
        for (BaiduQuestion baiduQuestion : questList) {
            if (!idList.contains(baiduQuestion.getId())){
                notRepeat.add(baiduQuestion);
            }
        }
        this.saveBatch(notRepeat);
        return Result.success("完事",null);
    }

    @Override
    public Result<?> killMysql() {
        this.baseMapper.killMysql();
        return Result.success("完事",null);
    }
}
