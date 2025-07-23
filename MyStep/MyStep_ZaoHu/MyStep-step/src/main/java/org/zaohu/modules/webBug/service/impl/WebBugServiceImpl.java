package org.zaohu.modules.webBug.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zaohu.utils.webBugUtils.webMagic.WebMagicUtils;
import org.zaohu.common.ResultCommon.Result;
import org.zaohu.modules.webBug.entity.BaiduQuestion;
import org.zaohu.modules.webBug.mapper.WebBugMapper;
import org.zaohu.modules.webBug.service.IWebBugService;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Function;

import static org.zaohu.utils.text.StringUtils.generateId;

@Service
public class WebBugServiceImpl extends ServiceImpl<WebBugMapper, BaiduQuestion> implements IWebBugService {
    @Autowired
    private WebBugMapper webBugMapper;

    /**
     * 获取几页的数据
     *
     * @param pages
     * @return
     */
    @Override
    public Result<?> executeBug(Integer pages) {
        ArrayList<BaiduQuestion> questList = new ArrayList<>();
        for (Integer i = 0, j = 0; i < pages; i++) {
            List<String> strings = WebMagicUtils.executeBug(j);
            for (String string : strings) {
                if (string.endsWith("？")) {
                    BaiduQuestion baiduQuestion = new BaiduQuestion();
//                    baiduQuestion.setId(Long.parseLong(Integer.toString(string.hashCode())));//32位的hashCode
                    baiduQuestion.setId(generateId(string));//更高效的MurmurHash3 高性能、低冲突率的非加密哈希算法
                    baiduQuestion.setQuestionText(string);
                    questList.add(baiduQuestion);
                }
            }
            j += 50;
        }

        if (questList.isEmpty()) {
            return Result.failed("无数据");
        }
        //防重
        QueryWrapper<BaiduQuestion> baiduQuestionQueryWrapper = new QueryWrapper<>();
        baiduQuestionQueryWrapper.lambda()
                .select(BaiduQuestion::getId);
        List<BaiduQuestion> baiduQuestions = webBugMapper.selectList(baiduQuestionQueryWrapper);
        List idList = new ArrayList<>();
        idList = baiduQuestions
                .stream()
                .map((Function<BaiduQuestion, Object>) BaiduQuestion::getId)
                .toList();
        ArrayList<BaiduQuestion> notRepeat = new ArrayList<>();
        for (BaiduQuestion baiduQuestion : questList) {
            if (!idList.contains(baiduQuestion.getId())) {
                notRepeat.add(baiduQuestion);
            }
        }
        this.saveBatch(notRepeat);
        return Result.success("完事", null);
    }

    @Override
    public Result<?> killMysql() {
        webBugMapper.killMysql();
        return Result.success("完事", null);
    }

    @Override
    public List<BaiduQuestion> getQuestionText() {
        return webBugMapper.selectList(null);
    }

    @Override
    public Long selectCount() {
        return webBugMapper.selectCount(null);
    }
}
