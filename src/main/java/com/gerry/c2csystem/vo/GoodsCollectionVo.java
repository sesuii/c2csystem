package com.gerry.c2csystem.vo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

/**
 * 商品收藏展示对象
 *
 * @author Gerry
 * @email sjiahui@gmail.com
 * @since 2022/5/29 0:44
 **/
@Data
public class GoodsCollectionVo {
    /**
     * 主键 ID
     */
    private Long id;

    /**
     * 用户 ID
     */
    private Long userId;

    /**
     * 关注商品 ID
     */
    private Long goodsId;

    /**
     * 关注商品名称
     */
    private String goodsName;

    /**
     * 关注商品状态
     */
    private Integer goodsStatus;

    /**
     * 关注商品价格
     */
    private BigDecimal goodsPrice;

    private List<String> goodsImgList;
}
