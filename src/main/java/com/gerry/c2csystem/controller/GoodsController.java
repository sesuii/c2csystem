package com.gerry.c2csystem.controller;

import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 商品展示接口
 *
 * @author Gerry
 * @email sjiahui@gmail.com
 * @since 2022/5/21 23:24
 **/
@RestController
@RequestMapping("/api/goods")
@Api(tags = "商品展示接口")
public class GoodsController {
    // TODO 1. 获取商品列表
    // TODO 2. 获取商品详细信息
    // TODO 3. 举报商品
}
