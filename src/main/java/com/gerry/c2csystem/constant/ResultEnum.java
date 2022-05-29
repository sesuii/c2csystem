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
    USER_NOT_FOUND(5002, "用户不存在"),
    AUTH_DENY(5003, "用户无访问权限"),
    // 商品相关状态码及信息
    GOODS_NOT_FOUND(5101, "该商品不存在"),

    // 订单相关状态码及信息
    ORDER_NOT_FOUND(5201, "该订单不存在"),
    ;
    private int code;
    private String message;
}
