package com.gerry.c2csystem.controller;

import com.gerry.c2csystem.constant.ResultEnum;
import com.gerry.c2csystem.dao.OrderInfoMapper;
import com.gerry.c2csystem.entity.OrderInfo;
import com.gerry.c2csystem.service.IOrderInfoService;
import com.gerry.c2csystem.vo.OrderInfoVo;
import com.gerry.c2csystem.vo.resp.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

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

    @Resource
    IOrderInfoService orderInfoService;

    @Resource
    OrderInfoMapper orderInfoMapper;

    @ApiOperation("查看所有订单")
    @PostMapping("/uid={uid}")
    public Result<?> getOrderVoList(@PathVariable Long uid) {
        List<OrderInfoVo> orderInfoVoList = orderInfoMapper.getOrderInfoVoList(uid);
        return Result.success(orderInfoVoList);
    }

    @ApiOperation("获取订单详细信息")
    @PostMapping("/get-order/orderId={orderId}")
    public Result<?> getOrderVo(@PathVariable Long orderId) {
        OrderInfoVo orderInfoVo = orderInfoMapper.getOrderInfoVo(orderId);
        return Result.success(orderInfoVo);
    }

    @ApiOperation("取消订单")
    @PostMapping("/cancel-order")
    public Result<?> cancelOrder(Long orderId) {
        OrderInfo orderInfo = orderInfoService.getById(orderId);
        if(orderInfo == null) {
            return Result.failed(ResultEnum.ORDER_NOT_FOUND);
        }
        boolean cancel = orderInfoService.cancelOrder(orderInfo);
        if(!cancel) {
            return Result.failed(ResultEnum.FAILED);
        }
        return Result.success();
    }

}
