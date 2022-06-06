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

    /**
     * 上传新的商品
     *
     * @param goodsVo 商品展示层对象
     * @param categoryId  商品类别 ID
     * @return
     *
     **/
    Long saveNewGoods(GoodsVo goodsVo, Long categoryId);

    /**
     * 修改商品信息
     *
     * @param newGoodsVo 修改后的商品
     * @param goodsId 需要修改的商品 ID
     * @return
     *
     **/
    boolean modifyGoods(GoodsVo newGoodsVo, Long goodsId);
}
