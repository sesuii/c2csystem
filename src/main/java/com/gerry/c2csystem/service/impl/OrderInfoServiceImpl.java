package com.gerry.c2csystem.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gerry.c2csystem.constant.GoodsStatusConstant;
import com.gerry.c2csystem.constant.OrderInfoStatusConstant;
import com.gerry.c2csystem.dao.OrderInfoMapper;
import com.gerry.c2csystem.entity.Goods;
import com.gerry.c2csystem.entity.OrderInfo;
import com.gerry.c2csystem.entity.User;
import com.gerry.c2csystem.service.IGoodsService;
import com.gerry.c2csystem.service.IOrderInfoService;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;

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

    @Resource
    IOrderInfoService orderInfoService;

    @Resource
    IGoodsService goodsService;

    @Override
    public boolean cancelOrder(OrderInfo orderInfo) {
        orderInfo.setStatus(OrderInfoStatusConstant.ORDER_HAS_DEL);
        boolean updateOrder = orderInfoService.updateById(orderInfo);
        Goods goods = goodsService.getById(orderInfo.getGoodsId());
        goods.setStatus(GoodsStatusConstant.GOODS_ON_SALE);
        boolean updateGoods = goodsService.updateById(goods);
        return updateGoods && updateOrder;
    }

    @Override
    public Long buyGoods(User user, Goods goods) {
        Date now = new Date();
        OrderInfo orderInfo = OrderInfo.builder()
                .payeeId(user.getId())
                .remitterId(goods.getUserId())
                .totPrice(goods.getGoodsPrice())
                .goodsId(goods.getId())
                .gmtCreate(now)
                .status(OrderInfoStatusConstant.ORDER_HAS_PAID)
                .build();
        boolean save = orderInfoService.save(orderInfo);
        if(!save) {
            return -1L;
        }
        // TODO 优化 -> 在 Redis 进行标记，先不修改数据库
        goods.setStatus(OrderInfoStatusConstant.ORDER_HAS_PAID);
        boolean update = goodsService.updateById(goods);
        if(!update) {
            return -1L;
        }
        return orderInfo.getId();
    }
}
