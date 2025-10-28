package org.zaohu.security.entity;

import cn.hutool.core.collection.CollectionUtil;
import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.zaohu.modules.userLogin.entity.User;

import java.util.*;

/**
 * @author Zaohu
 * @since 2024/12/5
 **/
@Data
@AllArgsConstructor
public class LoginUserDetails implements UserDetails {

    private User user;

    /*角色名*/
    private List<String> roleNames;

    /*权限名*/
    private List<String> permissionNames;

    public LoginUserDetails(User user) {
        this.user = user;
    }

    /**
     * 当前账户的权限列表
     * <p>
     * * 当前角色的权限信息
     * * 1. 角色表权限 ROLE_admin/.... 需要前缀
     * * 2. 权限表权限 del add query edit
     */
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        ArrayList<GrantedAuthority> grantedAuthorities = new ArrayList<>();

        if (!CollectionUtil.isEmpty(this.roleNames)) {
            for (String roleName : roleNames) {
                roleName = "ROLE_" + roleName;
                grantedAuthorities.add(new SimpleGrantedAuthority(roleName));
            }
        }
        if (!CollectionUtil.isEmpty(this.permissionNames)) {
            for (String permission : permissionNames) {
                grantedAuthorities.add(new SimpleGrantedAuthority(permission));
            }
        }

        return grantedAuthorities;
    }

    /**
     * 密码
     *
     * @return
     */
    @Override
    public String getPassword() {
        return user.getPassword();
    }

    /**
     * 用户名
     *
     * @return
     */
    @Override
    public String getUsername() {
        return user.getPhone();
    }

    //账户是否过期
    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    //账户是否被锁定
    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    //密码是否过期
    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    //账户是否有效
    @Override
    public boolean isEnabled() {
        return true;
    }
}
