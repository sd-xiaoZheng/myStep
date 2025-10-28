package org.zaohu.security.handler;

import cn.hutool.json.JSONUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;
import org.zaohu.common.ResultCommon.Result;

import java.io.IOException;

/**
 * 匿名请求访问私有化资源处理器
 * @author Zaohu
 * @since 2024/12/9
 **/
@Component
public class LoginUnAuthenticationEntryPointHandler implements AuthenticationEntryPoint {
    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException authException) throws IOException, ServletException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        Result<?> failed = Result.failed(401,"用户未登录或登陆已经过期，请重新登录");
        String jsonStr = JSONUtil.toJsonStr(failed);
        // 设置 Location 头部，指向登录页面
//        response.setStatus(HttpServletResponse.SC_FOUND);
//        response.setHeader("Location", "/login");
        response.getWriter().println(jsonStr);
    }
}
