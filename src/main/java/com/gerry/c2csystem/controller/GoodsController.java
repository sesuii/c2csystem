package com.gerry.c2csystem.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gerry.c2csystem.dao.GoodsMapper;
import com.gerry.c2csystem.vo.GoodsVo;
import com.gerry.c2csystem.vo.resp.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

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

    @Resource
    GoodsMapper goodsMapper;

    @ApiOperation("获取商品列表")
    @GetMapping("/get-list")
    public Result<?> skGoodsCategory() {
        Page<GoodsVo> page = new Page<>(1,10);
        IPage<GoodsVo> goodsVoIPage = goodsMapper.getGoodsVoList(page);
        return Result.success(goodsVoIPage);
    }

    @ApiOperation("获取商品详情信息")
    @GetMapping("/detail/goodsId={goodsId}")
    public Result<?> toDetail(@PathVariable Long goodsId) {
        GoodsVo goodsVo = goodsMapper.getGoodsVo(goodsId);
        return Result.success(goodsVo);
    }
}
