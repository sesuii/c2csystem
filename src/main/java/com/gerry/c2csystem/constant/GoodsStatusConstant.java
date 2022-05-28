package com.gerry.c2csystem.constant;

/**
 * 商品状态常量
 *
 * @author Gerry
 * @email sjiahui@gmail.com
 * @since 2022/5/21 23:05
 **/
public class GoodsStatusConstant {
    /**
     * 商品正在出售
     **/
    public static final int GOODS_ON_SALE = 0;

    /**
     * 商品已售出
     **/
    public static final int GOODS_HAS_SOLD = 1;

    /**
     * 商品已下架
     **/
    public static final int GOODS_NOT_ONSALE = 3;

    /**
     * 商品审核未通过
     **/
    public static final int GOODS_AUDIT_FAILED = 4;
}
