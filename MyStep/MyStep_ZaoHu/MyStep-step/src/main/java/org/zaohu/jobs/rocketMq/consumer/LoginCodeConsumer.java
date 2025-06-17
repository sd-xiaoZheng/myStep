package org.zaohu.jobs.rocketMq.consumer;

import cn.hutool.json.JSONUtil;
import com.alibaba.fastjson.JSON;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.spring.annotation.RocketMQMessageListener;
import org.apache.rocketmq.spring.core.RocketMQListener;
import org.springframework.stereotype.Service;
import org.zaohu.constant.Constant;
import org.zaohu.modules.userLogin.entity.User;
import org.zaohu.utils.EmailUtil;
import org.zaohu.utils.RedisUtils;

import java.util.Random;
import java.util.concurrent.TimeUnit;

/**
 * topic rocket的topic
 * selectorExpression rocket的Tag 用于区分broker中的topic中的不同Tag的消息
 * consumerGroup 的消费者组
 */
@Service
@Slf4j
@RocketMQMessageListener(topic = Constant.ROCKET_EMAIL_LOGIN_CODE_TOPIC, selectorExpression = "tag_loginCode", consumerGroup = "loginCode")
public class LoginCodeConsumer implements RocketMQListener<String> {
    @Resource
    private EmailUtil emailUtil;
    @Resource
    private RedisUtils redisUtils;

    @Override
    public void onMessage(String str) {
        User user = JSONUtil.toBean(str, User.class);
        Random random = new Random();
        int codeNum= random.nextInt(9000)+1000;
        int i = emailUtil.sendEmail(user.getEmail(), "Step验证码", "欢迎注册Step\n您的验证码为：" + codeNum);
        if (i==0){
            redisUtils.setEx(user.getEmail(),Integer.toString(codeNum),60, TimeUnit.SECONDS);
            log.info("电子邮件已经发送==>{}", JSON.toJSONString(str));
        }
    }
}