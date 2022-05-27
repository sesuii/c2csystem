package com.gerry.c2csystem.constant;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

/**
 * 返回状态码及信息
 *
 * @author Gerry
 * @email sjiahui@gmail.com
 * @since 2022/5/21 21:40
 **/
@Getter
@NoArgsConstructor
@AllArgsConstructor
public enum ResultEnum {

    // 通用状态码及信息
    SUCCESS(200, "SUCCESS"),
    FAILED(304, "服务端异常"),

    // 用户相关状态码及信息
    DUPLICATE_USER(5001, "该账号已注册"),
    AUTH_DENY(5003, "用户无访问权限"),


    ;
    private int code;
    private String message;
}
