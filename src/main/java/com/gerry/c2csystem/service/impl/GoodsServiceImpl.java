package com.gerry.c2csystem.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gerry.c2csystem.dao.GoodsMapper;
import com.gerry.c2csystem.entity.Goods;
import com.gerry.c2csystem.entity.GoodsImg;
import com.gerry.c2csystem.service.IGoodsImgService;
import com.gerry.c2csystem.service.IGoodsService;
import com.gerry.c2csystem.vo.GoodsVo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * <p>
 * 商品信息表 服务实现类
 * </p>
 *
 * @author Gerry
 * @since 2022-05-21
 */
@Service
public class GoodsServiceImpl extends ServiceImpl<GoodsMapper, Goods> implements IGoodsService {

    @Resource
    GoodsMapper goodsMapper;

    @Resource
    IGoodsImgService goodsImgService;

    @Override
    public Long saveNewGoods(GoodsVo goodsVo, Long categoryId) {
        List<String> images = goodsVo.getGoodsImgList();
        Date now = new Date();
        Long uid = goodsVo.getUserId();
        Goods goods = Goods.builder()
                .userId(uid)
                .categoryId(categoryId)
                .goodsName(goodsVo.getGoodsName())
                .goodsPrice(goodsVo.getGoodsPrice())
                .detailMessage(goodsVo.getDetailMessage())
                .gmtUpdate(now)
                .gmtCreate(now)
                .build();
        goodsMapper.insert(goods);
        Long goodsId = goods.getId();
        if(!saveImages(images, goodsId)) {
            return -1L;
        }
        return goodsId;
    }

    @Override
    public boolean modifyGoods(GoodsVo newGoodsVo, Long goodsId) {
        Goods goods = goodsMapper.selectById(goodsId);
        if(goods == null) {
            return false;
        }
        String goodsName = newGoodsVo.getGoodsName();
        String detailMessage = newGoodsVo.getDetailMessage();
        BigDecimal price = newGoodsVo.getGoodsPrice();
        if(goodsName != null) {
            goods.setGoodsName(goodsName);
        }
        if(detailMessage != null) {
            goods.setDetailMessage(detailMessage);
        }
        if(price != null) {
            goods.setGoodsPrice(price);
        }
        int update = goodsMapper.updateById(goods);
        if(update != 1) {
            return false;
        }

        List<String> imgList = newGoodsVo.getGoodsImgList();
        if(imgList != null) {
            goodsImgService.remove(new LambdaQueryWrapper<GoodsImg>()
                    .eq(GoodsImg::getGoodsId, goodsId)
            );
            saveImages(imgList, goodsId);
        }
        return true;
    }
    /**
     * 保存相关商品图片
     *
     * @param images 图片列表
     * @param goodsId 商品 ID
     * @return
     *
     **/
    private boolean saveImages(List<String> images, Long goodsId) {
        for(String img : images) {
            boolean save = goodsImgService.save(GoodsImg.builder()
                    .imgUrl(img)
                    .goodsId(goodsId)
                    .build());
            if(!save) {
                return false;
            }
        }
        return true;
    }

}
