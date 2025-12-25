package org.zaohu.utils.security;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.zaohu.modules.userLogin.entity.User;
import org.zaohu.security.entity.LoginUserDetails;
import org.zaohu.utils.RedisUtils;

/**
 * @author myStep
 * @since 2025/12/25
 **/

@Component
@RequiredArgsConstructor
public class SecurityUtils {
    private final RedisUtils redisUtils;

    public User getUser() {
        HttpServletRequest request = getRequest();
        if (request == null) {
            return null;
        }
        String authorization = request.getHeader("Authorization");
        if (authorization == null || !authorization.startsWith("Bearer ")) {
            return null;
        }
        String token = authorization.substring(7);
        return redisUtils.get(token, LoginUserDetails.class).getUser();
    }

    private HttpServletRequest getRequest() {
        ServletRequestAttributes attributes =
                (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        return attributes == null ? null : attributes.getRequest();
    }
}
