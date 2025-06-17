package org.zaohu.modules.userLogin.controller;

import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;
import org.zaohu.constant.Constant;
import org.zaohu.utils.JwtUtils;
import org.zaohu.utils.RedisUtils;
import org.zaohu.jobs.rocketMq.producer.RocketMQTemplateProducerUtils;
import org.zaohu.common.ResultCommon.Result;
import org.zaohu.modules.userLogin.entity.User;
import org.zaohu.modules.userLogin.mapper.UserMapper;
import org.zaohu.security.entity.LoginUserDetails;
import org.zaohu.utils.text.StringUtils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Objects;
import java.util.concurrent.TimeUnit;

/**
 * @author Zaohu
 * @since 2024/12/6
 **/
@Slf4j
@RestController
@RequestMapping("/step")
public class LoginController {


    @Resource
    private AuthenticationManager authenticationManager;
    @Resource
    private PasswordEncoder passwordEncoder;
    @Resource
    private RedisUtils redisUtils;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private RocketMQTemplateProducerUtils rocketMQTemplateProducerUtils;


    /**
     * 登录
     *
     * @param user 用户
     * @return 响应结果
     */
    @PostMapping("/login")
    public Result login(@RequestBody User user,
                        HttpServletRequest request) {
        ArrayList<Object> objects = new ArrayList<>();
        String phone = user.getPhone();
        String password = user.getPassword();
        //判断曾经有没有登陆过
        String token_ = request.getHeader("token");//请求头里的token拿出来
        if (!StringUtils.isEmpty(token_)) { //判断token是否存在
            String claim = JwtUtils.getClaim(token_);//从jwt中拿出当时存的手机号
            if (!StringUtils.isEmpty(claim) && phone.equals(claim)) {//判断是否是同一个用户
                String key = "login:token:" + token_;
                redisUtils.delete(key);
            }
        }

        //查看输入密码 加密后生成的密文
        String encode = passwordEncoder.encode(password);
        //封装用户名密码
        UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken = new UsernamePasswordAuthenticationToken(phone, password);


        //调用认证方法
        //如果成功这里面有用户的所有信息，包含认证信息 授权信息
        try {//因为可能权限不够 等出现异常 这里包一下
            Authentication authenticate = authenticationManager.authenticate(usernamePasswordAuthenticationToken);
            if (Objects.isNull(authenticate)) {
                return Result.failed("用户名或密码错误");
            }
            //生成token
            String token = JwtUtils.sign(phone, 1000 * 60 * 60 * 24 * 7L);
            //将生成的token保存到redis中
//            RedisUtils redisUtils = new RedisUtils();
            String key = "login:token:" + token;

            LoginUserDetails principal = (LoginUserDetails) authenticate.getPrincipal();
            String jsonStr = JSONUtil.toJsonStr(principal);
            redisUtils.setEx(key, jsonStr, 60 * 60 * 24 * 7L, TimeUnit.SECONDS);

            HashMap<String, String> map = new HashMap<>(1);
            map.put("token", token);
//            rocketMQTemplate.asyncSend();
            return Result.success("登录成功", map);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            return Result.failed("用户名或密码错误");
        }
    }

    /**
     * 登出
     */
    @PostMapping("/logout")
    public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String token = request.getHeader("authorization");
        if (StringUtils.isNotEmpty(token)) {
            String key = "login:token:" + token.split(" ")[1];
            redisUtils.delete(key);
        }
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        //返回客户端注销成功提示
        response.getWriter().println(JSONUtil.toJsonStr(Result.success("注销成功")));
    }

    @PostMapping("/register")
    public Result register(@RequestBody User user) {
        String code = user.getCode();
        Boolean b = redisUtils.hasKey(user.getEmail());
        if (!b) {
            return Result.failed("验证码已过期");
        } else {
            String redisCode = redisUtils.get(user.getEmail());
            if (!redisCode.equals(code)) {
                Result.failed("验证码错误");
            } else {
                //判断验证码是否一致 从redis中获取
                QueryWrapper<User> userQueryWrapper = new QueryWrapper<>();
                userQueryWrapper.lambda()
                        .eq(User::getPhone, user.getPhone());
                User phoneUser = userMapper.selectOne(userQueryWrapper);
                if (Objects.nonNull(phoneUser)) {
                    return Result.failed("手机号已经被注册");
                }
                userQueryWrapper.clear();
                userQueryWrapper.lambda()
                        .eq(User::getEmail, user.getEmail());
                User emailUser = userMapper.selectOne(userQueryWrapper);
                if (Objects.nonNull(emailUser)) {
                    return Result.failed("邮箱已经被注册");
                }
                user.setPassword(passwordEncoder.encode(user.getPassword()));
                userMapper.insert(user);
                //注册成功后删除RedisKey
                redisUtils.delete(user.getEmail());
            }
        }
        return Result.success("注册成功，现在可以登陆啦~");
    }

    @PostMapping("/sendCodeEmail")
    public Result sendCodeEmail(@RequestBody User user) {
        rocketMQTemplateProducerUtils.syncSendMessage(Constant.ROCKET_EMAIL_LOGIN_CODE_TOPICTAG, JSONUtil.toJsonStr(user));
        return Result.success("发送成功,请稍后查看~");
    }
}
