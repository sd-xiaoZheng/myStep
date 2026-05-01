package org.zaohu.modules.userLogin.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 * 角色权限关联表
 * </p>
 *
 * @author Step
 * @since 2024-12-16 10:30:33
 */
@Getter
@Setter
@TableName("role_permission")
public class RolePermission {

    private Long roleId;

    private Long permissionId;
}
