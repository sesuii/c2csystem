package com.gerry.c2csystem.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gerry.c2csystem.dao.AdminLogMapper;
import com.gerry.c2csystem.entity.AdminLog;
import com.gerry.c2csystem.service.IAdminLogService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 管理员操作表 服务实现类
 * </p>
 *
 * @author Gerry
 * @since 2022-05-21
 */
@Service
public class AdminLogServiceImpl extends ServiceImpl<AdminLogMapper, AdminLog> implements IAdminLogService {

}
