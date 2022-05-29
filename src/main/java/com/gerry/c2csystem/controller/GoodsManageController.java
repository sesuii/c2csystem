package com.gerry.c2csystem.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.gerry.c2csystem.constant.GoodsStatusConstant;
import com.gerry.c2csystem.constant.ResultEnum;
import com.gerry.c2csystem.entity.Goods;
import com.gerry.c2csystem.entity.GoodsImg;
import com.gerry.c2csystem.service.IGoodsImgService;
import com.gerry.c2csystem.service.IGoodsService;
import com.gerry.c2csystem.vo.GoodsVo;
import com.gerry.c2csystem.vo.resp.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

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

    @Resource
    IGoodsImgService goodsImgService;

    @ApiOperation("上传新的商品")
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

    @ApiOperation("获取商品状态")
    @GetMapping("/goodsId={goodsId}")
    public Result<?> getGoodsStatus(@PathVariable Long goodsId) {
         Goods goods = goodsService.getById(goodsId);
         if(goods == null) {
             return Result.failed(ResultEnum.GOODS_NOT_FOUND);
         }
        int status = goods.getStatus();
        if(status == GoodsStatusConstant.GOODS_ON_SALE) {
            return Result.success("商品在售中");
        }
        if(status == GoodsStatusConstant.GOODS_HAS_SOLD) {
            return Result.success("商品已售出");
        }
        if(status == GoodsStatusConstant.GOODS_NOT_ONSALE) {
            return Result.success("商品处于下架状态");
        }
        if(status == GoodsStatusConstant.GOODS_AUDIT_FAILED) {
            return Result.success("商品审核未通过");
        }
        return Result.success();
    }

    @ApiOperation("商品上架")
    @PostMapping("/status-up")
    public Result<?> onShelves(Goods goods) {
        goods.setStatus(GoodsStatusConstant.GOODS_ON_SALE);
        goodsService.updateById(goods);
        return Result.success();
    }

    @ApiOperation("商品下架")
    @PostMapping("/status-down")
    public Result<?> outShelves(Goods goods) {
        goods.setStatus(GoodsStatusConstant.GOODS_NOT_ONSALE);
        goodsService.updateById(goods);
        return Result.success();
    }

    @ApiOperation("删除商品")
    @GetMapping("/del-goods")
    public Result<?> outShelves(@RequestParam("goodsId") Long goodsId) {
        Goods goods = goodsService.getById(goodsId);
        if(goods == null) {
            return Result.failed(ResultEnum.GOODS_NOT_FOUND);
        }
        goodsImgService.remove(new LambdaQueryWrapper<GoodsImg>()
                .eq(GoodsImg::getGoodsId, goodsId)
        );
        goods.setDeleted(true);
        goodsService.updateById(goods);
        return Result.success();
    }

    @ApiOperation("修改商品信息")
    @PostMapping("/modify-goods")
    public Result<?> modifyGoods(@RequestBody GoodsVo newGoodsVo, Long goodsId) {
        boolean modify = goodsService.modifyGoods(newGoodsVo, goodsId);
        if(!modify) {
            return Result.failed(ResultEnum.FAILED);
        }
        return Result.success();
    }

}
