package com.gerry.c2csystem.vo;

import lombok.Data;

/**
 * 注册信息对象
 *
 * @author Gerry
 * @email sjiahui@gmail.com
 * @since 2022/5/27 23:57
 **/
@Data
public class RegisterVo {
    /**
     * 用户昵称
     */
    private String username;

    /**
     * 注册邮箱
     **/
    private String email;

    /**
     * 用户密码
     **/
    private String password;

    /**
     * 动态验证码
     **/
    private String emailCode;
}
