package org.zaohu.zaohugateway.filter;

import com.alibaba.fastjson.JSONObject;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import org.zaohu.zaohugateway.Utils.threadUtils.ThreadPoolUtils;
import org.zaohu.zaohugateway.jobs.threadJob.VisitorTask;
import reactor.core.publisher.Mono;

import static org.zaohu.zaohugateway.constant.Constant.*;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Objects;

/**
 * 自定义全局过滤器，统计接口调用时间
 */
@Component
public class MyGlobalFilter implements GlobalFilter, Ordered {
    @SuppressWarnings("rawtypes")//抑制警告：使用介绍：https://blog.csdn.net/euyy1029/article/details/52511773
    @Autowired
    private RedisTemplate redisTemplate;



    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        Object o = redisTemplate.opsForValue().get(REDIS_VISIT_NUM);
        if (Objects.isNull(o)) {
            redisTemplate.opsForValue().set(REDIS_VISIT_NUM, 1);
        } else {
            redisTemplate.opsForValue().increment(REDIS_VISIT_NUM, 1);//原子自增1
        }
        //记录开始时间
        exchange.getAttributes().put(BEGIN_VISIT_TIME, System.currentTimeMillis());
        //返回统计结果
        return chain.filter(exchange).then(Mono.fromRunnable(() -> {
            Long beginVisitTime = exchange.getAttribute(BEGIN_VISIT_TIME);
            JSONObject jsonObject = new JSONObject();
            if (beginVisitTime != null) {
                jsonObject.put("host", exchange.getRequest().getURI().getHost());
                jsonObject.put("port", exchange.getRequest().getURI().getPort());
                jsonObject.put("path", exchange.getRequest().getURI().getPath());
                jsonObject.put("url_param", exchange.getRequest().getURI().getRawQuery());
                jsonObject.put("time", System.currentTimeMillis() - beginVisitTime);
                jsonObject.put("access_date", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
            }
            Long aLong = redisTemplate.opsForList().leftPush(REDIS_VISIT_INFO, jsonObject);
//            if (aLong>3){
                //这里开线程去存储redis中的数据并且删除已经存储的 2024年11月17日 发现多线程引入redisTemplate优点问题，暂时使用定时任务来解决
//                ThreadPoolUtils newInstance = ThreadPoolUtils.getNewInstance();
//                newInstance.executor(new VisitorTask());
//            }
        }));
    }

    /**
     * 数字越小优先级越高
     *
     * @return
     */
    @Override
    public int getOrder() {
        return 0;
    }
}
