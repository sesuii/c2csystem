package com.gerry.c2csystem.controller;

import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 商品收藏接口
 *
 * @author Gerry
 * @email sjiahui@gmail.com
 * @since 2022/5/21 23:31
 **/
@RestController
@RequestMapping("/api/goods-collection")
@Api(tags = "商品收藏接口")
public class GoodsCollectionController {
    // TODO 收藏商品
    // TODO 取消收藏
    // TODO 查看收藏列表
}
