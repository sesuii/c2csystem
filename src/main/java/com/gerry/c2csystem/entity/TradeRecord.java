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
 * 交易记录表
 * </p>
 *
 * @author Gerry
 * @since 2022-05-21
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class TradeRecord implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 交易记录主键 ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 对应订单 ID
     */
    private Long orderId;

    /**
     * 汇款方 ID
     */
    private Long remitterId;

    /**
     * 收款方 ID
     */
    private Long payeeId;

    /**
     * 支付价格
     */
    private BigDecimal totPrice;

    /**
     * 交易时间
     */
    private Date tradingTime;


}
