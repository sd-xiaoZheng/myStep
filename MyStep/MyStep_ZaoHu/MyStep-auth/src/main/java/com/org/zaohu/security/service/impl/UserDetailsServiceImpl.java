package org.zaohu.security.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import jakarta.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zaohu.modules.userLogin.entity.*;
import org.zaohu.modules.userLogin.mapper.*;
import org.zaohu.security.entity.LoginUserDetails;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * 从数据库中获取用户信息，将用户信息送到SpringSecurity上下文
 *
 * @author Zaohu
 * @since 2024/12/5
 **/
@Transactional
@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    @Resource
    private UserMapper userMapper;
    @Autowired
    private UserRoleMapper userRoleMapper;
    @Autowired
    private RoleMapper roleMapper;
    @Autowired
    private RolePermissionMapper rolePermissionMapper;
    @Autowired
    private PermissionMapper permissionMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        QueryWrapper<User> userQueryWrapper = new QueryWrapper<>();
        userQueryWrapper.lambda().eq(User::getPhone, username);
        User user = userMapper.selectOne(userQueryWrapper);
        if (Objects.isNull(user)) {
            userQueryWrapper.clear();
            userQueryWrapper.lambda().eq(User::getEmail, username);
            user = userMapper.selectOne(userQueryWrapper);
            if (Objects.isNull(user)) {
                throw new UsernameNotFoundException(username);
            }
        }
        //当前用户角色名称列表
        ArrayList<String> rooleNameList = new ArrayList<>();
        //当前用户的权限名称列表
        ArrayList<String> permissionNameList = new ArrayList<>();
        //获取用户角色列表
        QueryWrapper<UserRole> userRoleQueryWrapper = new QueryWrapper<>();
        userRoleQueryWrapper.lambda()
                .eq(UserRole::getUserId, user.getUserId());
        List<UserRole> userRoles = userRoleMapper.selectList(userRoleQueryWrapper);
        if (!userRoles.isEmpty()) {
            List<Long> roleIdList = userRoles.stream().map(UserRole::getRoleId).toList();
            if (!roleIdList.isEmpty()) {
                QueryWrapper<Role> roleQueryWrapper = new QueryWrapper<>();
                roleQueryWrapper.lambda()
                        .in(Role::getRoleId, roleIdList);
                List<Role> roles = roleMapper.selectList(roleQueryWrapper);
                if (!roles.isEmpty()) {
                    List<String> roleNames = roles.stream().map(Role::getRoleName).toList();
                    rooleNameList.addAll(roleNames);
                }
            //当前角色下的权限列表
                QueryWrapper<RolePermission> rolePermissionQueryWrapper = new QueryWrapper<>();
                rolePermissionQueryWrapper.lambda()
                                .in(RolePermission::getRoleId, roleIdList);
                List<RolePermission> rolePermissions = rolePermissionMapper.selectList(rolePermissionQueryWrapper);
                if (!rolePermissions.isEmpty()) {
                    List<Long> permissionIdList = rolePermissions.stream().map(RolePermission::getPermissionId).toList();
                    if (!permissionIdList.isEmpty()) {
                        QueryWrapper<Permission> permissionQueryWrapper = new QueryWrapper<>();
                        permissionQueryWrapper.lambda()
                                .in(Permission::getPermissionId, permissionIdList);
                        List<Permission> permissions = permissionMapper.selectList(permissionQueryWrapper);
                        if (!permissions.isEmpty()) {
                            List<String> permissionsNameList = permissions.stream().map(Permission::getPermissionName).toList();
                            permissionNameList.addAll(permissionsNameList);
                        }
                    }
                }
            }
        }
        return new LoginUserDetails(user, rooleNameList, permissionNameList);
    }
}
