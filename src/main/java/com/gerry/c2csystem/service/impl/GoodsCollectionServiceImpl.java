package com.gerry.c2csystem.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gerry.c2csystem.dao.GoodsCollectionMapper;
import com.gerry.c2csystem.entity.Goods;
import com.gerry.c2csystem.entity.GoodsCollection;
import com.gerry.c2csystem.service.IGoodsCollectionService;
import com.gerry.c2csystem.service.IGoodsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.xml.crypto.Data;
import java.util.Date;

/**
 * <p>
 * 用户收藏表 服务实现类
 * </p>
 *
 * @author Gerry
 * @since 2022-05-21
 */
@Service
public class GoodsCollectionServiceImpl extends ServiceImpl<GoodsCollectionMapper, GoodsCollection> implements IGoodsCollectionService {

    @Resource
    IGoodsCollectionService goodsCollectionService;
    @Resource
    IGoodsService goodsService;

    @Override
    public boolean collectGoods(Goods goods, Long collectUid) {
        Date now = new Date();
        GoodsCollection goodsCollection = GoodsCollection.builder()
                .userId(collectUid)
                .goodsId(goods.getId())
                .goodsName(goods.getGoodsName())
                .goodsStatus(goods.getStatus())
                .goodsPrice(goods.getGoodsPrice())
                .gmtCreate(now)
                .gmtUpdate(now)
                .build();
        boolean collection = goodsCollectionService.save(goodsCollection);
        if(!collection) {
            return false;
        }
        int stared = goods.getStaredTimes();
        goods.setStaredTimes(stared + 1);
        return goodsService.updateById(goods);
    }

    @Override
    public boolean cancelCollection(Goods goods, Long collectUid) {
        boolean cancel = goodsCollectionService.remove(new LambdaQueryWrapper<GoodsCollection>()
                .eq(GoodsCollection::getGoodsId, goods.getId())
                .eq(GoodsCollection::getUserId, collectUid)
        );
        if(!cancel) {
            return false;
        }
        int stared = goods.getStaredTimes();
        goods.setStaredTimes(stared - 1);
        return goodsService.updateById(goods);
    }
}
