package com.gerry.c2csystem.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.gerry.c2csystem.entity.Goods;
import com.gerry.c2csystem.entity.GoodsCollection;

/**
 * <p>
 * 用户收藏表 服务类
 * </p>
 *
 * @author Gerry
 * @since 2022-05-21
 */
public interface IGoodsCollectionService extends IService<GoodsCollection> {

    /**
     * 收藏商品
     *
     * @param goods 商品
     * @param collectUid 收藏用户 ID
     * @return
     *
     **/
    boolean collectGoods(Goods goods, Long collectUid);

    /**
     * 取消收藏
     *
     * @param goods 商品
     * @param collectUid 收藏用户 ID
     * @return
     *
     **/
    boolean cancelCollection(Goods goods, Long collectUid);
}
