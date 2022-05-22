package com.gerry.c2csystem.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gerry.c2csystem.dao.ChatRecordMapper;
import com.gerry.c2csystem.entity.ChatRecord;
import com.gerry.c2csystem.service.IChatRecordService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 聊天记录表 服务实现类
 * </p>
 *
 * @author Gerry
 * @since 2022-05-21
 */
@Service
public class ChatRecordServiceImpl extends ServiceImpl<ChatRecordMapper, ChatRecord> implements IChatRecordService {

}
