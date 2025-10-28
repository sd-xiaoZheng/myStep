package org.zaohu.security.filter;

import cn.hutool.json.JSONUtil;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;
import org.zaohu.utils.RedisUtils;
import org.zaohu.security.entity.LoginUserDetails;
import org.zaohu.utils.text.StringUtils;

import java.io.IOException;
import java.util.Objects;

/**
 * 统一token凭据处理
 * 这个是前端登录后 每次请求头都会传一个token，
 * 这里是处理这个token拿到token对应的用户信息给到UsernamePasswordAuthenticationFilter送到security上下文
 * @author Zaohu
 * @since 2024/12/9
 **/
@Component
public class JwtAuthenticationTokenFilter extends OncePerRequestFilter {

    @Autowired
    private RedisUtils redisUtils;
    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        //获取token
        String token = request.getHeader("Authorization");
        if (StringUtils.isNotEmpty(token)) {
            String key = "login:token:" + token.split(" ")[1];
            String json = redisUtils.get(key);
            if (StringUtils.isNotEmpty(json)) {
                LoginUserDetails userDetails = JSONUtil.toBean(json, LoginUserDetails.class);
                if (Objects.nonNull(userDetails)) {
                    UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
                    SecurityContextHolder.getContext().setAuthentication(authenticationToken);
                }else {
                    SecurityContextHolder.getContext().setAuthentication(null);
                }
            }
        }
        filterChain.doFilter(request, response);//放行
    }
}

