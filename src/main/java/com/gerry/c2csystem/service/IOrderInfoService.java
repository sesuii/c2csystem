package com.gerry.c2csystem.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.gerry.c2csystem.entity.Goods;
import com.gerry.c2csystem.entity.OrderInfo;
import com.gerry.c2csystem.entity.User;

/**
 * <p>
 * 订单信息表 服务类
 * </p>
 *
 * @author Gerry
 * @since 2022-05-21
 */
public interface IOrderInfoService extends IService<OrderInfo> {

    boolean cancelOrder(OrderInfo orderInfo);

    Long payOrder(User user, Goods goods);
}
