package com.gerry.c2csystem.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gerry.c2csystem.dao.TradeRecordMapper;
import com.gerry.c2csystem.entity.TradeRecord;
import com.gerry.c2csystem.service.ITradeRecordService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 交易记录表 服务实现类
 * </p>
 *
 * @author Gerry
 * @since 2022-05-21
 */
@Service
public class TradeRecordServiceImpl extends ServiceImpl<TradeRecordMapper, TradeRecord> implements ITradeRecordService {

}
