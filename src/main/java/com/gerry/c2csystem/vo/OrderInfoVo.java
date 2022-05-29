package com.gerry.c2csystem.vo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.gerry.c2csystem.entity.Goods;
import com.gerry.c2csystem.entity.User;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 订单详情展示层对象
 *
 * @author Gerry
 * @email sjiahui@gmail.com
 * @since 2022/5/28 20:59
 **/

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@JsonIgnoreProperties(value = "handler")
public class OrderInfoVo implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 订单 ID
     */
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

    private User remitter;
    private User payee;
    private Goods goods;
}
