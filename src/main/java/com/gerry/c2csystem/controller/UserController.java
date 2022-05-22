package com.gerry.c2csystem.controller;

import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 用户管理接口
 *
 * @author Gerry
 * @email sjiahui27@gmail.com
 * @since 2022/5/21 21:10
 **/

@RestController
@RequestMapping("/api/user")
@Api(tags = "用户信息操作接口", value = "获取用户信息，用户修改密码等")
public class UserController {
    // TODO 获取用户详细信息
    // TODO 用户修改信息（用户名 or 密码）
    // TODO 获取用户信誉记录
}
