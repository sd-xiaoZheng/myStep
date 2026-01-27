package org.zaohu.utils.security;

import org.springframework.security.core.context.SecurityContextHolder;
import org.zaohu.modules.userLogin.entity.User;
import org.zaohu.security.entity.LoginUserDetails;

/**
 * @author myStep
 * @since 2025/12/25
 **/

public class SecurityUtils {
    public static User getUser() {
        LoginUserDetails principal = (LoginUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return principal.getUser();
    }
}
