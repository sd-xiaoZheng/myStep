package org.zaohu.modules.userLogin.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.zaohu.modules.userLogin.entity.User;

/**
 * 操作数据库user表
 * @author Zaohu
 * @since 2024/12/5
 **/
@Mapper
public interface UserMapper extends BaseMapper<User> {

}
