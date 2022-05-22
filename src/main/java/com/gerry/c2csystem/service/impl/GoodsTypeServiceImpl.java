package com.gerry.c2csystem.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gerry.c2csystem.dao.GoodsTypeMapper;
import com.gerry.c2csystem.entity.GoodsType;
import com.gerry.c2csystem.service.IGoodsTypeService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 商品类别标签表 服务实现类
 * </p>
 *
 * @author Gerry
 * @since 2022-05-21
 */
@Service
public class GoodsTypeServiceImpl extends ServiceImpl<GoodsTypeMapper, GoodsType> implements IGoodsTypeService {

}
