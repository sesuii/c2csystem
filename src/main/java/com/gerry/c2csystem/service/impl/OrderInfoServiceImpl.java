package com.gerry.c2csystem.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gerry.c2csystem.dao.OrderInfoMapper;
import com.gerry.c2csystem.entity.Goods;
import com.gerry.c2csystem.entity.OrderInfo;
import com.gerry.c2csystem.entity.User;
import com.gerry.c2csystem.service.IOrderInfoService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 * 订单信息表 服务实现类
 * </p>
 *
 * @author Gerry
 * @since 2022-05-21
 */
@Service
public class OrderInfoServiceImpl extends ServiceImpl<OrderInfoMapper, OrderInfo> implements IOrderInfoService {

    @Override
    public boolean cancelOrder(OrderInfo orderInfo) {
        // 改变订单状态
        // 改变商品状态
        return false;
    }

    @Override
//    @Transactional()
    public Long payOrder(User user, Goods goods) {
        // 生成订单
        // 改变商品状态
        // 生成支付记录
        // 支付接口？
        return null;
    }
}
