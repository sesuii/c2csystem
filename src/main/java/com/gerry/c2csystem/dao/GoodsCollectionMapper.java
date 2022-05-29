package com.gerry.c2csystem.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.gerry.c2csystem.entity.GoodsCollection;
import com.gerry.c2csystem.vo.GoodsCollectionVo;

import java.util.List;

/**
 * <p>
 * 用户收藏表 Mapper 接口
 * </p>
 *
 * @author Gerry
 * @since 2022-05-21
 */
public interface GoodsCollectionMapper extends BaseMapper<GoodsCollection> {

    List<GoodsCollectionVo> getGoodsCollectionList(Long uid);
}
