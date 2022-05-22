package com.gerry.c2csystem.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gerry.c2csystem.dao.GoodsMapper;
import com.gerry.c2csystem.entity.Goods;
import com.gerry.c2csystem.service.IGoodsService;
import org.springframework.stereotype.Service;

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

}
