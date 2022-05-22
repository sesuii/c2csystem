package com.gerry.c2csystem.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gerry.c2csystem.dao.SubCommentMapper;
import com.gerry.c2csystem.entity.SubComment;
import com.gerry.c2csystem.service.ISubCommentService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 二级评论表 服务实现类
 * </p>
 *
 * @author Gerry
 * @since 2022-05-21
 */
@Service
public class SubCommentServiceImpl extends ServiceImpl<SubCommentMapper, SubComment> implements ISubCommentService {

}
