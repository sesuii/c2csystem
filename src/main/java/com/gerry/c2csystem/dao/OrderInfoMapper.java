package com.gerry.c2csystem.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gerry.c2csystem.entity.OrderInfo;
import com.gerry.c2csystem.vo.OrderInfoVo;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 * 订单信息表 Mapper 接口
 * </p>
 *
 * @author Gerry
 * @since 2022-05-21
 */
public interface OrderInfoMapper extends BaseMapper<OrderInfo> {

    /**
     * 获取商品订单详细信息
     *
     * @param orderId 商品订单 ID
     * @return OrderInfoVo
     *
     **/
    @ResultMap("OrderInfoVoMap")
    @Select("select * from order_info o where o.id = #{orderId}")
    OrderInfoVo getOrderInfoVo(@Param("orderId") Long orderId);

    /**
     * 获取指定用户的全部订单信息
     *
     * @param page 分页
     * @param uid 用户 ID
     * @return IPage
     *
     **/
    @ResultMap("OrderInfoVoMap")
    @Select("select * from order_info o where o.remitter_id = #{uid} or o.payee_id = #{uid}")
    IPage<OrderInfoVo> getOrderInfoVoList(Page<OrderInfoVo> page, @Param("uid") Long uid);
}
