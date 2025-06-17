package org.zaohu.jobs.schedulJob;


import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.zaohu.constant.Constant;
import org.zaohu.modules.visitNum.entity.VisitNum;
import org.zaohu.modules.visitNum.mapper.VisitNumMapper;

import javax.annotation.Resource;
import java.util.Objects;

@Configuration
@EnableScheduling
@RequiredArgsConstructor
/*是否开启定时任务通过application配置文件中的scheduling.enabled配置**/
//@ConditionalOnProperty(prefix = "scheduling", name = "enabled", havingValue = "true")
public class TimingSave {
    private final VisitNumMapper visitNumMapper;
    @SuppressWarnings("rawtypes")//抑制警告：使用介绍：https://blog.csdn.net/euyy1029/article/details/52511773
    @Resource
    private RedisTemplate redisTemplate;

    /**
     * 定时保存访问次数
     */
    @Scheduled(cron = "0 0/10 * * * ?")//每十分钟一次
    private void getValueByIdsRealTime() {
        VisitNum visitNum = visitNumMapper.selectById(1);
        Object o = redisTemplate.opsForValue().get(Constant.REDIS_VISIT_NUM);
        if (Objects.nonNull(o)){
            long l = Long.parseLong(o.toString());
            Long visitNum1 = visitNum.getVisitNum();
            visitNum.setVisitNum(visitNum1+l);
        }
        if (visitNumMapper.insertOrUpdate(visitNum)) redisTemplate.opsForValue().set(Constant.REDIS_VISIT_NUM, 0);
    }
}
