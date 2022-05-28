package com.gerry.c2csystem.vo;

import com.gerry.c2csystem.entity.GoodsImg;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

/**
 * 商品详细信息对象 数据传输层 & 展示层
 *
 * @author Gerry
 * @email sjiahui@gmail.com
 * @since 2022/5/28 19:00
 **/
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class GoodsVo implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 商品主键 ID
     */
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
     * 商品价格
     */
    private BigDecimal goodsPrice;

    /**
     * 商品详细信息
     */
    private String detailMessage;

    /**
     * 被关注次数
     */
    private Integer staredTimes;

    /**
     * 0在售 1已售出 2已删除 3下架 4审核未通过
     */
    private Integer status;

    /**
     * 类别名称
     */
    private String typeName;

    /**
     * 类别权重
     */
    private Integer weight;

    /**
     * 商品图片列表
     */
    private List<String> goodsImgList;

}
