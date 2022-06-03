package com.gerry.c2csystem.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gerry.c2csystem.entity.Comment;
import com.gerry.c2csystem.vo.CommentVo;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 * 评论表 Mapper 接口
 * </p>
 *
 * @author Gerry
 * @since 2022-05-21
 */
public interface CommentMapper extends BaseMapper<Comment> {



    IPage<CommentVo> getCommentPage(Page<CommentVo> page, @Param("goodsId") Long goodsId);
}
