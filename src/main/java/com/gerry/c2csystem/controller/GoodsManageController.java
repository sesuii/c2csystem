package com.gerry.c2csystem.controller;

import com.gerry.c2csystem.constant.ResultEnum;
import com.gerry.c2csystem.service.IGoodsService;
import com.gerry.c2csystem.vo.GoodsVo;
import com.gerry.c2csystem.vo.resp.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

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

    @Resource
    IGoodsService goodsService;

    @ApiOperation("用户上传新的商品")
    @PostMapping("/add-goods")
    public Result<?> addNewGoods(@RequestBody GoodsVo goodsVo, Long categoryId) {
        if(goodsVo == null) {
            return Result.failed(ResultEnum.FAILED);
        }
        Long goodsId = goodsService.saveNewGoods(goodsVo, categoryId);
        if(goodsId == -1L) {
            return Result.failed(ResultEnum.FAILED);
        }
        return Result.success(goodsId);
    }
    // TODO 获取商品状态
    // TODO 商品上架
    // TODO 商品下架
    // TODO 商品信息修改
    // TODO 删除商品

}
