package org.zaohu.modules.userLogin.service.Impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.zaohu.modules.userLogin.entity.User;
import org.zaohu.modules.userLogin.mapper.UserMapper;
import org.zaohu.modules.userLogin.service.UserService;

/**
 * <p>
 * 用户表 服务实现类
 * </p>
 *
 * @author Step
 * @since 2024-12-16 09:46:54
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

}
