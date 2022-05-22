package com.gerry.c2csystem.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * <p>
 * 订单信息表
 * </p>
 *
 * @author Gerry
 * @since 2022-05-21
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class OrderInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 订单 ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 汇款方 ID
     */
    private Long remitterId;

    /**
     * 支付方 ID
     */
    private Long payeeId;

    /**
     * 商品 ID
     */
    private Long goodsId;

    /**
     * 总价格
     */
    private BigDecimal totPrice;

    /**
     * 订单创建时间
     */
    private Date gmtCreate;

    /**
     * 订单状态 0新建 1已支付 2已取消
     */
    private Integer status;


}
