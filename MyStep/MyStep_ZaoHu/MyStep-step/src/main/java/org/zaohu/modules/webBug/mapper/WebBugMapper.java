package org.zaohu.modules.webBug.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.zaohu.modules.webBug.entity.BaiduQuestion;

@Mapper
public interface WebBugMapper extends BaseMapper<BaiduQuestion> {
    public void killMysql();
}
