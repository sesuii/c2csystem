package com.gerry.c2csystem.controller;

import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 订单管理接口
 *
 * @author Gerry
 * @email sjiahui@gmail.com
 * @since 2022/5/21 21:20
 **/
@RestController
@RequestMapping("/api/order-info")
@Api(tags = "用户订单管理接口")
public class OrderInfoController {
    // TODO 查看历史/所有订单
    // TODO 1. 获取订单详细信息
    // TODO 2. 获取订单状态
    // TODO 3. 支付订单 事务锁
    // TODO 4. 获取交易记录
    // TODO 5. 取消订单
    // TODO 6. 交易评价
}
