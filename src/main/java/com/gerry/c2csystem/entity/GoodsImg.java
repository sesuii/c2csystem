package com.gerry.c2csystem.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.*;

import java.io.Serializable;

/**
 * <p>
 * 商品图片表
 * </p>
 *
 * @author Gerry
 * @since 2022-05-21
 */
@Data
@Builder
@EqualsAndHashCode(callSuper = false)
public class GoodsImg implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键 ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long imgId;

    /**
     * 商品 ID
     */
    private Long goodsId;

    /**
     * 图片 url
     */
    private String imgUrl;


}
