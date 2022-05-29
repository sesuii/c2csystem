package com.gerry.c2csystem.controller;

import com.gerry.c2csystem.constant.ResultEnum;
import com.gerry.c2csystem.entity.Goods;
import com.gerry.c2csystem.entity.User;
import com.gerry.c2csystem.service.IGoodsService;
import com.gerry.c2csystem.service.IOrderInfoService;
import com.gerry.c2csystem.service.IUserService;
import com.gerry.c2csystem.vo.resp.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * 交易管理接口
 *
 * @author Gerry
 * @email sjiahui@gmail.com
 * @since 2022/5/29 10:52
 **/
@Api(tags = "交易管理接口")
@RestController
@RequestMapping("/api/order-info")
public class TradingController {

    @Resource
    IGoodsService goodsService;

    @Resource
    IUserService userService;

    @Resource
    IOrderInfoService orderInfoService;

    @ApiOperation("支付订单")
    @PostMapping("/pay-order")
    public Result<?> payOrder(@RequestParam("uid") Long uid, @RequestParam("goodsId") Long goodsId) {
        Goods goods = goodsService.getById(goodsId);
        if(goods == null) {
            return Result.failed(ResultEnum.GOODS_NOT_FOUND);
        }
        User user = userService.getById(uid);
        if(user == null) {
            return Result.failed(ResultEnum.USER_NOT_FOUND);
        }

        Long orderId = orderInfoService.payOrder(user, goods);
        if(orderId == -1L) {
            return Result.failed(ResultEnum.FAILED);
        }
        return Result.success(orderId);
    }

    // TODO 4. 获取交易记录
    // TODO 6. 交易评价
}
