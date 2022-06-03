package com.gerry.c2csystem.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.gerry.c2csystem.vo.GoodsVo;
import com.gerry.c2csystem.entity.Goods;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

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

    IPage<GoodsVo> getGoodsVoList(IPage<?> page);

    GoodsVo getGoodsVo(Long goodsId);

    @Select("select * from goods where id = #{id}")
    Goods selectGoodsById(@Param("id") Long id);

}
