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

    boolean addComment(CommentVo commentVo, User user);

    boolean addSubComment(SubCommentVo subCommentVo, User user);
}
