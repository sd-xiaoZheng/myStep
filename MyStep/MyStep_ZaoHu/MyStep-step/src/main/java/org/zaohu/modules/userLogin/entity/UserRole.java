package org.zaohu.modules.userLogin.entity;

import com.baomidou.mybatisplus.annotation.TableName;
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
public class UserRole {

    private Long userId;

    private Long roleId;
}
