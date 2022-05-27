package com.gerry.c2csystem.service.impl;

import com.gerry.c2csystem.constant.RedisConstant;
import com.gerry.c2csystem.service.IVerifyService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Random;

/**
 * 动态码验证实现类
 *
 * @author Gerry
 * @email sjiahui@gmail.com
 * @since 2022/5/28 0:10
 **/
@Service
public class VerifyServiceImpl implements IVerifyService {

    @Resource
    JavaMailSender mailSender;

    @Resource
    private RedisTemplate<String, Object> redisTemplate;

    @Value("${spring.mail.username}")
    String fromMail;

    @Override
    public void sendVerifyCode(String email) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(fromMail);
        message.setTo(email);
        message.setSubject("【酱菜淘】注册验证码");
        Random random = new Random();
        int verifyCode = random.nextInt(899999) + 100000;
        message.setText("欢迎您的注册！\n您的注册验证码为："+ verifyCode +" 三分钟内有效，请及时完成注册！如果非本人操作，请忽略。");
        redisTemplate.opsForValue().set(RedisConstant.USER_EMAIL_PREFIX + email, verifyCode + "", RedisConstant.VERIFY_EXPIRE_TIME);
        mailSender.send(message);
    }
}
