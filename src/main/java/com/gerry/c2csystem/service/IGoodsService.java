package com.gerry.c2csystem.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.gerry.c2csystem.entity.Goods;
import com.gerry.c2csystem.vo.GoodsVo;

/**
 * <p>
 * 商品信息表 服务类
 * </p>
 *
 * @author Gerry
 * @since 2022-05-21
 */
public interface IGoodsService extends IService<Goods> {

    Long saveNewGoods(GoodsVo goodsVo, Long categoryId);
}
