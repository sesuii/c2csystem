package com.gerry.c2csystem.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.gerry.c2csystem.vo.GoodsVo;
import com.gerry.c2csystem.entity.Goods;

import java.util.List;

/**
 * <p>
 * 商品信息表 Mapper 接口
 * </p>
 *
 * @author Gerry
 * @since 2022-05-28
 */
public interface GoodsMapper extends BaseMapper<Goods> {

    List<GoodsVo> getGoodsVoList();

    GoodsVo getGoodsVo(Long goodsId);

}
