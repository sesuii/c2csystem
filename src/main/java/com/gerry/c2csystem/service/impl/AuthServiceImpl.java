package com.gerry.c2csystem.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.gerry.c2csystem.entity.User;
import com.gerry.c2csystem.service.IUserService;
import com.gerry.c2csystem.vo.UserVo;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * auth
 *
 * @author Gerry
 * @email sjiahui@gmail.com
 * @since 2022/5/28 15:34
 **/
@Service
public class AuthServiceImpl implements UserDetailsService {

    @Resource
    IUserService UserService;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        User user = UserService.getOne(
                new LambdaQueryWrapper<User>()
                        .eq(User::getEmail, email)
        );
        if(user == null) {
            throw new UsernameNotFoundException("该用户不存在");
        }
        return UserVo.builder()
                .user(user)
                .build();
    }

}
