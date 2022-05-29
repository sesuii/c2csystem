package com.gerry.c2csystem.controller;

import com.gerry.c2csystem.constant.ResultEnum;
import com.gerry.c2csystem.dao.GoodsCollectionMapper;
import com.gerry.c2csystem.entity.Goods;
import com.gerry.c2csystem.entity.GoodsCollection;
import com.gerry.c2csystem.service.IGoodsCollectionService;
import com.gerry.c2csystem.service.IGoodsService;
import com.gerry.c2csystem.vo.GoodsCollectionVo;
import com.gerry.c2csystem.vo.resp.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

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

    @Resource
    IGoodsCollectionService goodsCollectionService;

    @Resource
    IGoodsService goodsService;

    @Resource
    GoodsCollectionMapper goodsCollectionMapper;

    @ApiOperation("收藏商品")
    @GetMapping("/collect-goods")
    public Result<?> collectGoods(@RequestParam("goodsId") Long goodsId, @RequestParam("collectUid") Long collectUid) {
        Goods goods = goodsService.getById(goodsId);
        if(goods == null) {
            return Result.failed(ResultEnum.GOODS_NOT_FOUND);
        }
        boolean collect = goodsCollectionService.collectGoods(goods, collectUid);
        if(!collect) {
            return Result.failed(ResultEnum.FAILED);
        }
        return Result.success();
    }
    @ApiOperation("取消收藏")
    @GetMapping("/collect-cancel")
    public Result<?> cancelCollection(@RequestParam("goodsId") Long goodsId, @RequestParam("collectUid") Long collectUid) {
        Goods goods = goodsService.getById(goodsId);
        if(goods == null) {
            return Result.failed(ResultEnum.GOODS_NOT_FOUND);
        }
        boolean cancel = goodsCollectionService.cancelCollection(goods, collectUid);
        if(!cancel) {
            return Result.failed(ResultEnum.FAILED);
        }
        return Result.success();
    }

    @ApiOperation("查看收藏列表")
    @PostMapping("/get-collection-list")
    public Result<?> getCollectionList(@RequestParam("uid") Long uid) {
        List<GoodsCollectionVo> goodsCollectionVoList = goodsCollectionMapper.getGoodsCollectionList(uid);
        return Result.success(goodsCollectionVoList);
    }
}
