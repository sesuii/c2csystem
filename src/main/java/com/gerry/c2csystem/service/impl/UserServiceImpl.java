package com.gerry.c2csystem.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gerry.c2csystem.dao.UserMapper;
import com.gerry.c2csystem.entity.User;
import com.gerry.c2csystem.service.IUserService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户表 服务实现类
 * </p>
 *
 * @author Gerry
 * @since 2022-05-21
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

}
