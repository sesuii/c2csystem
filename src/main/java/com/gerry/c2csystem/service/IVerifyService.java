package com.gerry.c2csystem.service;

/**
 * 动态码验证
 *
 * @author Gerry
 * @email sjiahui@gmail.com
 * @since 2022/5/28 0:10
 **/
public interface IVerifyService {
    void sendVerifyCode(String email);
}
