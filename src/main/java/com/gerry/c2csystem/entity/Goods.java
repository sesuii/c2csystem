package com.gerry.c2csystem.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Blob;
import java.util.Date;

/**
 * <p>
 * 商品信息表
 * </p>
 *
 * @author Gerry
 * @since 2022-05-21
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class Goods implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 商品主键 ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 从属用户 ID
     */
    private Long userId;

    /**
     * 商品名
     */
    private String goodsName;

    /**
     * 商品类别
     */
    private Long categoryId;

    /**
     * 商品价格
     */
    private BigDecimal goodsPrice;

    /**
     * 商品详细信息
     */
    private Blob detailMessage;

    /**
     * 被关注次数
     */
    private Integer staredTimes;

    /**
     * 创建时间
     */
    private Date gmtCreate;

    /**
     * 更新时间
     */
    private Date gmtUpdate;

    /**
     * 逻辑删除
     */
    private Integer deleted;

    /**
     * 0在售 1已售出 2已删除 3下架 4审核未通过
     */
    private Integer status;


}
