package com.gerry.c2csystem.controller;

import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.*;


/**
 * 身份验证接口
 *
 * @author Gerry
 * @email sjiahui27@gmail.com
 * @since 2022/5/21 21:06
 **/
@Api(tags = "用户认证接口", value = "包括用户登录、注册操作")
@RestController
@RequestMapping("/api/auth")
public class AuthController {
    // TODO 用户登录
    // TODO 注册
    // TODO 动态码验证
    // TODO 退出登录
}

