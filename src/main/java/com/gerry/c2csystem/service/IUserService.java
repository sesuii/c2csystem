package com.gerry.c2csystem.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.gerry.c2csystem.entity.User;
import com.gerry.c2csystem.vo.RegisterVo;

import java.util.Map;

/**
 * <p>
 * 用户表 服务类
 * </p>
 *
 * @author Gerry
 * @since 2022-05-21
 */
public interface IUserService extends IService<User> {

    /**
     * 用户注册账号
     *
     * @param registerVo 注册对象
     * @return
     *
     **/
    boolean createAccount(RegisterVo registerVo);

    Map<String, String> toLogin(User user);
}
