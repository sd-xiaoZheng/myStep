package org.zaohu.interceptor;

import io.github.bucket4j.Bandwidth;
import io.github.bucket4j.Bucket;
import io.github.bucket4j.Refill;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import java.time.Duration;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.ConcurrentHashMap;

@Component
public class LoginRateLimitInterceptor implements HandlerInterceptor {

    // 存每个IP的桶
    public static final Map<String, Bucket> bucketCache = new ConcurrentHashMap<>();

    // 创建限流规则：1分钟最多5次
    private Bucket createNewBucket() {
        Refill refill = Refill.greedy(5, Duration.ofMinutes(1));
        Bandwidth limit = Bandwidth.classic(5, refill);
        return Bucket.builder().addLimit(limit).build();
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //获取真实IP（适配Nginx）
        // 如果在nginx后面需要nginx配置：proxy_set_header X-Forwarded-For $remote_addr;否则所有请求都是一个 IP → 全部被限死
        String ip = request.getHeader("X-Forwarded-For");
        if (Objects.isNull(ip) || ip.isEmpty()) {
            ip = request.getRemoteAddr();
        }
        // 获取或创建桶
        Bucket bucket = bucketCache.computeIfAbsent(ip, k -> createNewBucket());
        // 尝试消费1个请求
        if (bucket.tryConsume(1)) {
            return true;
        }
        // 超限处理
        response.setContentType("application/json;charset=UTF-8");
        response.getWriter().write("{\"code\":429,\"message\":\"请求过于频繁，请稍后再试~\"}");
        return false;
    }
}