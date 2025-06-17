package org.zaohu.config.feign;

import feign.Contract;
import feign.Logger;
import feign.Request;
import org.springframework.cloud.openfeign.support.SpringMvcContract;
import org.springframework.context.annotation.Bean;

/**
 * 这个类专门配置feign的日志级别
 * 注意：feign的内部日志级别是当debug级别时才生效，所以要配置spring的级别为debug 默认是info
 * @author Zaohu
 * @since 2025/2/17
 **/
//@Configuration//这里如果加了Configuration注解，这个类就作用与feign的全局配置，如果不想作用全局在FeignClient注解中有一个configuration参数，指定到这个类就可以了
public class FeignLogConfig {

    /**
     * 日志级别
     * @return
     */
    @Bean
    public Logger.Level feignLoggerLevel() {
        /**
         * NONE【性能最佳，适用于生产】:不记录任何日志(默认值)
         * BASIC【适用于生产环境追踪问题】:仅记录请求方法、URL、响应状态代码以及执行时间
         * HEADERS:记录BASIC级别的基础上，记录请求和响应的header。
         * FULL【比较适用于开发及测试环境定位问题】:记录请求和响应的header、body和元数据
         */
        return Logger.Level.FULL;
    }


    /**
     * 全局配置feign超时时间
     * @return
     */
//    @Bean
//    public Request.Options feignRequestOptions() {
//        return new Request.Options(4 * 1024 * 1024, 4 * 1024 * 1024);
//    }

    /**
     * 修改契约配置，支持feign原生注解  一般不会使用feign的原生注解 可能有老版本在用
     * @return
     */
//    @Bean
//    public Contract feignContract() {
//        return new Contract.Default();
//    }

}
