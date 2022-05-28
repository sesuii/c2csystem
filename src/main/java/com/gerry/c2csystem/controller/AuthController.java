package com.gerry.c2csystem.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.gerry.c2csystem.constant.RedisConstant;
import com.gerry.c2csystem.constant.ResultEnum;
import com.gerry.c2csystem.entity.User;
import com.gerry.c2csystem.vo.resp.Result;
import com.gerry.c2csystem.service.IUserService;
import com.gerry.c2csystem.service.IVerifyService;
import com.gerry.c2csystem.vo.RegisterVo;
import io.swagger.annotations.Api;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Map;


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

    @Resource
    IUserService userService;

    @Resource
    IVerifyService verifyService;

    @Resource
    RedisTemplate<String, Object> redisTemplate;

    @GetMapping("/verify-code")
    public Result<?> verifyCode(@RequestParam("email") String email) {
        User user = userService.getOne(new LambdaQueryWrapper<User>()
                .eq(User::getEmail, email)
        );
        if(user != null) {
            return Result.failed(ResultEnum.DUPLICATE_USER);
        }
        verifyService.sendVerifyCode(email);
        return Result.success();
    }

    @PostMapping("/register")
    public Result<?> register(@RequestBody RegisterVo registerVo) {
        boolean isRegister = userService.createAccount(registerVo);
        if(!isRegister) {
            return Result.failed(ResultEnum.FAILED);
        }
        return Result.success();
    }

    @PostMapping("/to-login")
    public Result<?> toLogin(@RequestBody User user) {
        Map<String, String> token = userService.toLogin(user);
        return Result.success(token);
    }

    @GetMapping("/logout")
    public Result<?> logout(@RequestParam("email") String email) {
        redisTemplate.delete(RedisConstant.USER_EMAIL_PREFIX + email);
        return Result.success();
    }
}

