package org.zaohu.security.handler;

import cn.hutool.json.JSONUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.stereotype.Component;
import org.zaohu.utils.RedisUtils;
import org.zaohu.common.ResultCommon.Result;
import org.zaohu.utils.text.StringUtils;

import java.io.IOException;

/**
 * @author Zaohu
 * @since 2024/12/15
 **/
@Component
public class LogoutStatusSuccessHandler implements LogoutSuccessHandler {

    @Autowired
    private RedisUtils redisUtils;

    @Override
    public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        String token = request.getHeader("token");
        if (StringUtils.isNotEmpty(token)) {
            String key = "login:token:" + token;
            redisUtils.delete(key);
        }
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        //返回客户端注销成功提示
        response.getWriter().println(JSONUtil.toJsonStr(Result.success("注销成功")));
    }
}
