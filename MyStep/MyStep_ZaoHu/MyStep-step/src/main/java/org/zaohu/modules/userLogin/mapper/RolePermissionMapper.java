package org.zaohu.modules.userLogin.mapper;

import org.zaohu.modules.userLogin.entity.RolePermission;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 角色权限关联表 Mapper 接口
 * </p>
 *
 * @author Step
 * @since 2024-12-16 10:30:33
 */
@Mapper
public interface RolePermissionMapper extends BaseMapper<RolePermission> {

}
