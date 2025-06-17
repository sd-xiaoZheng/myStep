package org.zaohu.utils;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * @author Zaohu
 * @since 2025/1/21
 **/
@Slf4j
@Component
public class EmailUtil {
    @Resource
    JavaMailSender javaMailSender;
    @Value("${spring.mail.username}")
    private String from;
    public int sendEmail(String who, String title, String content) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setSubject(title);
        message.setFrom(from);
        message.setTo(who);
        message.setSentDate(new Date());
        message.setText(content);
        try {
            javaMailSender.send(message);
            return 0;
        } catch (MailException e) {
            log.error(e.getMessage());
            throw new RuntimeException("send email error", e); //TODO 自定义异常
        }
    }
}
