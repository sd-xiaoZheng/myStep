package org.zaohu.jobs.rocketMq.consumer;

import cn.hutool.json.JSONUtil;
import com.alibaba.fastjson.JSON;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.spring.annotation.RocketMQMessageListener;
import org.apache.rocketmq.spring.core.RocketMQListener;
import org.springframework.stereotype.Service;
import org.zaohu.constant.Constant;
import org.zaohu.constant.RedisKey;
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
@RocketMQMessageListener(topic = Constant.ROCKET_EMAIL_TOPIC, selectorExpression = Constant.ROCKET_TAG_FORGET_CODE, consumerGroup = "forget")
public class ForgetCodeConsumer implements RocketMQListener<String> {
    @Resource
    private EmailUtil emailUtil;
    @Resource
    private RedisUtils redisUtils;

    @Override
    public void onMessage(String str) {
        User user = JSONUtil.toBean(str, User.class);
        Random random = new Random();
        int codeNum = random.nextInt(9000) + 1000;
        int i = emailUtil.sendEmail(user.getEmail(), "Step验证码", "【安全验证通知】您正在进行忘记密码重置操作，本次验证码为："
                + codeNum
                + "。该验证码 1 分钟内有效，请勿向他人泄露。如非本人操作，请及时检查账号安全。"
        );
        if (i == 0) {
            redisUtils.setEx(RedisKey.FORGET_CODE+user.getEmail(), Integer.toString(codeNum), 60, TimeUnit.SECONDS);
            log.info("电子邮件已经发送==>{}", JSON.toJSONString(str));
        }
    }
}