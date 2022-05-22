package com.gerry.c2csystem.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gerry.c2csystem.dao.UserDetailMapper;
import com.gerry.c2csystem.entity.UserDetail;
import com.gerry.c2csystem.service.IUserDetailService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户详细消息表 服务实现类
 * </p>
 *
 * @author Gerry
 * @since 2022-05-21
 */
@Service
public class UserDetailServiceImpl extends ServiceImpl<UserDetailMapper, UserDetail> implements IUserDetailService {

}
