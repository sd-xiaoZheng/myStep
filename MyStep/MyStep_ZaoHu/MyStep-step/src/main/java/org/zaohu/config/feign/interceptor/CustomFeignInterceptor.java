package org.zaohu.config.feign.interceptor;

import feign.RequestTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @author Zaohu
 * @since 2025/2/18
 **/
public class CustomFeignInterceptor implements feign.RequestInterceptor {
    Logger logger = LoggerFactory.getLogger(CustomFeignInterceptor.class);
    @Override
    public void apply(RequestTemplate requestTemplate) {
        logger.info("feign拦截器 拦截的是微服务直接的调用");
    }
}
