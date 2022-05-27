package com.gerry.c2csystem;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;

import javax.annotation.Resource;

@SpringBootTest
class C2csystemApplicationTests {

    @Resource
    JavaMailSender sender;

    /**
     * 邮件发送测试
     *
     * @return
     *
     **/
    @Test
    void contextLoads() {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setSubject("【江西财经大学教务处】关于近期学校对您的处分决定");
        message.setText("XXX同学您好，经监控和教务巡查发现，您近期存在旷课、迟到、早退、上课刷抖音行为，" +
                "现已通知相关辅导员，请手写5000字书面检讨，并在2022年13月14日17点前交到辅导员办公室。");
        message.setTo("2723724163@qq.com");
        message.setFrom("2316020516@qq.com");
        sender.send(message);
    }
}
