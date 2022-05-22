package com.gerry.c2csystem.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gerry.c2csystem.dao.ContentTypeMapper;
import com.gerry.c2csystem.entity.ContentType;
import com.gerry.c2csystem.service.IContentTypeService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 消息类型表 服务实现类
 * </p>
 *
 * @author Gerry
 * @since 2022-05-21
 */
@Service
public class ContentTypeServiceImpl extends ServiceImpl<ContentTypeMapper, ContentType> implements IContentTypeService {

}
