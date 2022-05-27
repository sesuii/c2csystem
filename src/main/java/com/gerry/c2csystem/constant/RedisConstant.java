package com.gerry.c2csystem.constant;

/**
 * Redis 相关常量
 *
 * @author Gerry
 * @email sjiahui@gmail.com
 * @since 2022/5/28 0:51
 **/
public class RedisConstant {
    /**
     * Token 存活时间 6h
     */
    public static final int TOKEN_EXPIRE_TIME = 1000 * 3600 * 6;

    /**
     * verify-code 动态验证码有效时间 3min
     */
    public static final int VERIFY_EXPIRE_TIME = 1000 * 60 * 3;

    /**
     * 用户 ID 为 key 存储在 redis 中，以该字符串为前缀
     */
    public static final String USER_ID_PREFIX = "userId:";

    /**
     * 用户邮箱为 key 存储在 redis 中，以该字符串为前缀
     */
    public static final String USER_EMAIL_PREFIX = "email:";

}
