package com.gerry.c2csystem.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.gerry.c2csystem.entity.User;
import com.gerry.c2csystem.entity.UserDetail;
import com.gerry.c2csystem.vo.resp.Result;
import com.gerry.c2csystem.service.IUserDetailService;
import com.gerry.c2csystem.service.IUserService;
import com.gerry.c2csystem.vo.UserDetailVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

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
    @Resource
    IUserService userService;

    @Resource
    IUserDetailService userDetailService;

    @ApiOperation("获取用户信息")
    @GetMapping("/user-info")
    public Result<?> info() {
        SecurityContext context = SecurityContextHolder.getContext();
        User user = userService.getOne(
                new LambdaQueryWrapper<User>()
                        .eq(User::getEmail, context.getAuthentication().getName())
        );
        UserDetail userDetail = userDetailService.getOne(
                new LambdaQueryWrapper<UserDetail>()
                        .eq(UserDetail::getUserId, user.getId())
        );
        UserDetailVo userDetailVo = UserDetailVo.builder()
                .user(user)
                .userDetail(userDetail)
                .build();
        return Result.success(userDetailVo);
    }

    @ApiOperation("用户修改信息")
    @PostMapping("/modify-user-info")
    public Result<?> modifyUserInfo(Long uid, String nickName, String img) {
        User user = userService.getById(uid);
        if(nickName != null) {
            user.setNickName(nickName);
        }
        if(img != null) {
            user.setImg(img);
        }
        userService.updateById(user);
        return null;
    }
}
