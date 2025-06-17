package org.zaohu.modules.userLogin.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
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
@ApiModel(value = "RolePermission对象", description = "角色权限关联表")
public class RolePermission {

    @ApiModelProperty("角色ID")
    private Long roleId;

    @ApiModelProperty("权限ID")
    private Long permissionId;
}
