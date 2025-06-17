package org.zaohu.modules.userLogin.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 * 用户角色关联表
 * </p>
 *
 * @author Step
 * @since 2024-12-16 10:23:16
 */
@Getter
@Setter
@TableName("user_role")
@ApiModel(value = "UserRole对象", description = "用户角色关联表")
public class UserRole {

    @ApiModelProperty("用户ID")
    private Long userId;

    @ApiModelProperty("角色ID")
    private Long roleId;
}
