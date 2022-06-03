package com.gerry.c2csystem.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gerry.c2csystem.dao.CommentMapper;
import com.gerry.c2csystem.entity.Comment;
import com.gerry.c2csystem.entity.SubComment;
import com.gerry.c2csystem.entity.User;
import com.gerry.c2csystem.service.ICommentService;
import com.gerry.c2csystem.service.ISubCommentService;
import com.gerry.c2csystem.vo.CommentVo;
import com.gerry.c2csystem.vo.SubCommentVo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.xml.crypto.Data;
import java.util.Date;

/**
 * <p>
 * 评论表 服务实现类
 * </p>
 *
 * @author Gerry
 * @since 2022-05-21
 */
@Service
public class CommentServiceImpl extends ServiceImpl<CommentMapper, Comment> implements ICommentService {

    @Resource
    ICommentService commentService;

    @Resource
    ISubCommentService subCommentService;

    @Override
    public boolean addComment(CommentVo commentVo, User user) {
        Date now = new Date();
        Comment comment = Comment.builder()
                .goodsId(commentVo.getGoodsId())
                .fromUid(user.getId())
                .nickName(user.getNickName())
                .userImg(user.getImg())
                .content(commentVo.getContent())
                .gmtUpdate(now)
                .gmtCreate(now)
                .build();
        return commentService.save(comment);
    }

    @Override
    public boolean addSubComment(SubCommentVo subCommentVo, User user) {
        Date now = new Date();
        SubComment subComment = SubComment.builder()
                .commentId(subCommentVo.getCommentId())
                .fromUid(user.getId())
                .fromNickName(user.getNickName())
                .targetUid(subCommentVo.getTargetUid())
                .content(subCommentVo.getContent())
                .gmtCreate(now)
                .build();
        return subCommentService.save(subComment);
    }
}
