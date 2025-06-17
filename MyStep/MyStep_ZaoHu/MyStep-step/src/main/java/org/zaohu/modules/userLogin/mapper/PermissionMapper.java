package org.zaohu.modules.userLogin.mapper;

import org.zaohu.modules.userLogin.entity.Permission;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 权限表 Mapper 接口
 * </p>
 *
 * @author Step
 * @since 2024-12-16 10:29:50
 */
@Mapper
public interface PermissionMapper extends BaseMapper<Permission> {

}
