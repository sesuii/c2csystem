package com.gerry.c2csystem.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
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

    @ResultMap("OrderInfoVoMap")
    @Select("select * from order_info o where o.id = #{orderId}")
    OrderInfoVo getOrderInfoVo(@Param("orderId") Long orderId);

    @ResultMap("OrderInfoVoMap")
    @Select("select * from order_info o where o.remitter_id = #{uid} or o.payee_id = #{uid}")
    List<OrderInfoVo> getOrderInfoVoList(@Param("uid") Long uid);
}
