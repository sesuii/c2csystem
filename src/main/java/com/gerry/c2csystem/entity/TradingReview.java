package com.gerry.c2csystem.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * <p>
 * 交易评价表
 * </p>
 *
 * @author Gerry
 * @since 2022-05-21
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class TradingReview implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键 ID
     */
    private Long id;

    /**
     * 评价用户 ID
     */
    private Long uid;

    /**
     * 被评商品 ID
     */
    private Long goodsId;

    /**
     * 评分 满分5.0
     */
    private BigDecimal score;

    /**
     * 评价内容
     */
    private String content;

    /**
     * 评价类型
     */
    private Long contentTypeId;


}
