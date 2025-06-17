package org.zaohu.zaohugateway;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.reactive.CorsWebFilter;
import org.springframework.web.cors.reactive.UrlBasedCorsConfigurationSource;

import java.util.Collections;

@SpringBootApplication
@MapperScan("org.zaohu.*.*.*.mapper")
//@MapperScan("org.zaohu.*.*.*")
public class ZaohuGatewayApplication {

    public static void main(String[] args) {
        SpringApplication.run(ZaohuGatewayApplication.class, args);
    }


    //添加这里是解决了困扰我好几天的问题 前端页面访问不通popst携带参数的请求，是因为网关没有进行 CORS 配置 阻挡了跨域请求
    //corsWebFilter 是一个 CorsWebFilter 的 Bean，用于处理 CORS 配置：
    //CorsConfiguration 用于设置 CORS 相关信息，包括：
    //setAllowedOrigins(Collections.singletonList("http://192.168.1.113:8008"))：允许来自 http://192.168.1.113:8008 的请求。
    //setMaxAge(3600L)：设置预检请求的缓存时间。
    //addAllowedMethod：添加允许的请求方法，这里添加了 GET、POST、PUT、DELETE。
    //addAllowedHeader：添加允许的请求头，这里添加了 Content-Type 和 Authorization。
    //setAllowCredentials(true)：允许携带凭证，如 cookies。
    //UrlBasedCorsConfigurationSource 用于存储 CORS 配置，registerCorsConfiguration("/**", corsConfig) 表示将配置应用于所有路径。
    //最后创建并返回 CorsWebFilter 实例，用于处理 CORS 相关逻辑。
//    @Bean
//    public CorsWebFilter corsWebFilter() {
//        CorsConfiguration corsConfig = new CorsConfiguration();
//        corsConfig.setAllowedOrigins(Collections.singletonList("http://192.168.1.113:8008"));
//        corsConfig.setMaxAge(3600L);
//        corsConfig.addAllowedMethod("GET");
//        corsConfig.addAllowedMethod("POST");
//        corsConfig.addAllowedMethod("PUT");
//        corsConfig.addAllowedMethod("DELETE");
//        corsConfig.addAllowedHeader("Content-Type");
//        corsConfig.addAllowedHeader("Authorization");
//        corsConfig.setAllowCredentials(true);
//
//        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
//        source.registerCorsConfiguration("/**", corsConfig);
//
//        return new CorsWebFilter(source);
//    }
//    @Bean
//    public CorsWebFilter corsWebFilter() {
//        CorsConfiguration corsConfig = new CorsConfiguration();
//        corsConfig.setMaxAge(3600L);
//        // 使用 allowedOriginPatterns 允许所有源
////        corsConfig.setAllowedOrigins(Collections.singletonList("http://192.168.1.113:8008"));
//        corsConfig.setAllowedOrigins(Collections.singletonList("*"));
////        corsConfig.addAllowedMethod("*");
////        corsConfig.addAllowedHeader("*");
//        corsConfig.addAllowedMethod("GET");
//        corsConfig.addAllowedMethod("POST");
//        corsConfig.addAllowedMethod("PUT");
//        corsConfig.addAllowedMethod("DELETE");
//        corsConfig.addAllowedHeader("Content-Type");
//        corsConfig.addAllowedHeader("Authorization");
////        corsConfig.setAllowCredentials(true);
//        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
//        source.registerCorsConfiguration("/**", corsConfig);
//        return new CorsWebFilter(source);
//    }
}
