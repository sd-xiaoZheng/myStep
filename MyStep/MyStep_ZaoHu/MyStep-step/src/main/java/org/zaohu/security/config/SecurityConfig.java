package org.zaohu.security.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.zaohu.security.handler.LoginUnAccessDeniedHandler;
import org.zaohu.security.handler.LogoutStatusSuccessHandler;
import org.zaohu.security.filter.JwtAuthenticationTokenFilter;
import org.zaohu.security.handler.LoginUnAuthenticationEntryPointHandler;

/**
 * SpringSecurity 配置类
 *
 * @author Zaohu
 * @since 2024/12/6
 **/
@Slf4j
@Configuration
@EnableMethodSecurity(securedEnabled = true)//开启方法权限
public class SecurityConfig {

    @Autowired
    private LoginUnAuthenticationEntryPointHandler loginUnAuthenticationEntryPointHandler;
    @Autowired
    private JwtAuthenticationTokenFilter jwtAuthenticationTokenFilter;
    @Autowired
    private LogoutStatusSuccessHandler logoutStatusSuccessHandler;
    @Autowired
    private LoginUnAccessDeniedHandler loginUnAccessDeniedHandler;

    /**
     * SpringSecurity过滤器
     */
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                .authorizeHttpRequests(auth ->
                                // 允许所有用户访问 /login 路径，不需要认证
                                //下面这句话的理解就是：所有requestMatchers里面的请求都不需要认证permitAll 除了这些其他的所有请求都需要认证才能访问
                                auth.requestMatchers("/step/login",
                                                "/test1",
                                                "/MyStep/ws/**",
                                                "/step/sendCodeEmail",
                                                "/step/register",
                                                "/step/Zaohu/**")
//                                .hasAuthority("user")//有权限
                                        .permitAll()//不需要认证
                                        .anyRequest()//拿到所有的请求 /test1  /test2
                                        .authenticated()//所有的都需要认证才能访问
                )// 其它所有请求都需要身份认证才能访问


                //将自定义的filter注册到security过滤器中，并设置到UsernamePasswordAuthenticationFilter前
                .addFilterBefore(jwtAuthenticationTokenFilter, UsernamePasswordAuthenticationFilter.class)


//                .formLogin(form ->
//                        form.loginProcessingUrl("/login")// 登录请求的处理 URL
//                                .usernameParameter("name")// 用户名参数名
//                                .passwordParameter("passwd"))// 密码参数名

                //csrf是一种跨站的网络攻击
                //这里为什么禁止：一般项目都是前后端分离的，所以客户端由多个端组成 可能是web、小程序、安卓、IOS
                //所以可能有人去伪装自己 就比如PC端伪装成小程序之类的 能不能进来 能 因为一个接口可能多个端使用
                // 禁用 CSRF（跨站请求伪造）防护。通常用于 REST API 中，因为这些接口大多是无状态的。
                //
                .csrf(csrf ->
                        csrf.disable())// 禁用 CSRF 防护

                //这里应该是允许所有的跨域
//                .cors(cors->cors.disable())
                // 配置会话管理策略，设置为无状态（STATELESS），意味着服务器不再存储用户的会话信息。
                .sessionManagement(session ->
                        session.sessionCreationPolicy(SessionCreationPolicy.STATELESS)// 无状态会话管理
                )
                //注册注销的处理器
                .logout(logout -> logout.logoutSuccessHandler(logoutStatusSuccessHandler))
                .exceptionHandling(exception -> exception.accessDeniedHandler(loginUnAccessDeniedHandler))
                //注册匿名访问私有资源的处理器
                .exceptionHandling(exc -> {
                    exc.authenticationEntryPoint(loginUnAuthenticationEntryPointHandler);
                });
        return http.build();


        //6.1版本之前的配置
//        http.csrf().disable() //防止跨站请求伪造
//                .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS) //取消session
//                .and()
//                .authorizeRequests()
//                .antMatchers("/login").permitAll() //登陆和未登录的人都可以访问访问
//                .anyRequest().authenticated()//除了上面设置的地址可以匿名访问,其它所有的请求地址需要认证访问
//        return http.build();

//        return http.build();
    }

    /**
     * 配置密码工具
     *
     * @return
     */
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    /**
     * 配置认证管理器
     */
    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration authenticationConfiguration) throws Exception {
        return authenticationConfiguration.getAuthenticationManager();
    }

}
