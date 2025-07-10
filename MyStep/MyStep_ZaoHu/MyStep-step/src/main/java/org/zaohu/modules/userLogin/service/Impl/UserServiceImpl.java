package org.zaohu.modules.userLogin.service.Impl;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import jakarta.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.zaohu.Enum.ErrorEnum.ErrorEnum;
import org.zaohu.common.ResultCommon.Result;
import org.zaohu.common.myException.BusinessException;
import org.zaohu.constant.RedisKey;
import org.zaohu.modules.userLogin.entity.User;
import org.zaohu.modules.userLogin.mapper.UserMapper;
import org.zaohu.modules.userLogin.service.UserService;
import org.zaohu.utils.RedisUtils;

import java.util.Objects;

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

    @Autowired
    private UserMapper userMapper;
    @Resource
    private PasswordEncoder passwordEncoder;
    @Resource
    private RedisUtils redisUtils;

    @Override
    public void forgetPwd(User user) {
        String code = user.getCode();
        Boolean b = redisUtils.hasKey(RedisKey.FORGET_CODE + user.getEmail());
        if (!b) {
            throw new BusinessException(ErrorEnum.CODE_OVERDUE);
        }
        String redisCode = redisUtils.get(RedisKey.FORGET_CODE + user.getEmail());
        if (!redisCode.equals(code)) {
            Result.failed("验证码错误");
        }
        UpdateWrapper<User> updateWrapper = new UpdateWrapper<>();
        // 设置更新条件：手机号或者邮箱
        if (Objects.nonNull(user.getPhone()) && Objects.nonNull(user.getEmail())) {
            updateWrapper.eq("phone", user.getPhone());
            updateWrapper.eq("email", user.getEmail());
        } else {
            throw new BusinessException(ErrorEnum.FORGET_ERROR);
        }
        // 设置要更新的字段（新密码）
        updateWrapper.set("password", passwordEncoder.encode(user.getPassword()));        // 执行更新操作
        int update = userMapper.update(null, updateWrapper);
        if (update != 1) {
            throw new BusinessException(ErrorEnum.CODE_OVERDUE);
        }
    }
}
