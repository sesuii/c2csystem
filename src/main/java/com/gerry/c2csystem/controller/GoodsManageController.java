package com.gerry.c2csystem.controller;

import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 商品管理接口
 *
 * @author Gerry
 * @email sjiahui@gmail.com
 * @since 2022/5/21 23:07
 **/
@RestController
@RequestMapping("/api/goods-manage")
@Api(tags = "商品管理接口")
public class GoodsManageController {
    // TODO 商品上架
    // TODO 商品下架
    // TODO 商品信息修改
    // TODO 删除商品
}
