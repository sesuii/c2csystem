package com.gerry.c2csystem.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.gerry.c2csystem.vo.GoodsVo;
import com.gerry.c2csystem.entity.Goods;
import io.swagger.models.auth.In;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;
import java.util.Date;
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

    List<GoodsVo> getGoodsDtoList();

    GoodsVo getGoodsDto(Long goodsId);

}
