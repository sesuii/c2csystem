package com.gerry.c2csystem.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.gerry.c2csystem.entity.Comment;
import com.gerry.c2csystem.entity.SubComment;
import com.gerry.c2csystem.entity.User;
import com.gerry.c2csystem.vo.CommentVo;
import com.gerry.c2csystem.vo.SubCommentVo;

/**
 * <p>
 * 评论表 服务类
 * </p>
 *
 * @author Gerry
 * @since 2022-05-21
 */
public interface ICommentService extends IService<Comment> {

    /**
     * 添加一级评论
     *
     * @param commentVo 评论展示层对象
     * @param user 用户
     * @return
     *
     **/
    boolean addComment(CommentVo commentVo, User user);

    /**
     * 添加二级评论
     *
     * @param subCommentVo 子评论展示层对象
     * @param user 用户
     * @return
     *
     **/
    boolean addSubComment(SubCommentVo subCommentVo, User user);
}
