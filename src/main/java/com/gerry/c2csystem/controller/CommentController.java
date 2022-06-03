package com.gerry.c2csystem.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gerry.c2csystem.constant.ResultEnum;
import com.gerry.c2csystem.dao.CommentMapper;
import com.gerry.c2csystem.entity.Comment;
import com.gerry.c2csystem.entity.Goods;
import com.gerry.c2csystem.entity.User;
import com.gerry.c2csystem.service.ICommentService;
import com.gerry.c2csystem.service.IGoodsService;
import com.gerry.c2csystem.service.IUserService;
import com.gerry.c2csystem.vo.CommentVo;
import com.gerry.c2csystem.vo.SubCommentVo;
import com.gerry.c2csystem.vo.resp.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * 用户评论接口
 *
 * @author Gerry
 * @email sjiahui@gmail.com
 * @since 2022/5/21 23:34
 **/
@RestController
@RequestMapping("/api/comment")
@Api(tags = "用户评论接口")
public class CommentController {

    public final static int DELETE_STATUS = 1;
    @Resource
    private ICommentService commentService;

    @Resource
    private IGoodsService goodsService;

    @Resource
    private CommentMapper commentMapper;

    @Resource
    private IUserService userService;

    @ApiOperation("获取评论列表")
    @GetMapping("/{goodsId}/get-list")
    public Result<?> getCommentList(@PathVariable Long goodsId) {
        Page<CommentVo> page = new Page<>(1, 10);
        IPage<CommentVo> commentVoIPage = commentMapper.getCommentPage(page, goodsId);
        return Result.success(commentVoIPage);
    }

    @ApiOperation("发表一级评论")
    @PostMapping("/add-comment")
    public Result<?> addComment(@RequestBody CommentVo commentVo) {
        Long goodsId = commentVo.getGoodsId();
        User user = userService.getById(commentVo.getFromUid());
        Goods goods = goodsService.getById(goodsId);
        if(goods == null || user == null) {
            return Result.failed(ResultEnum.GOODS_NOT_FOUND);
        }
        boolean add = commentService.addComment(commentVo, user);
        if (!add) {
            return Result.failed(ResultEnum.FAILED);
        }
        return Result.success();
    }

    @ApiOperation("发表二级评论")
    @PostMapping("/add-subcomment")
    public Result<?> addSubComment(@RequestBody SubCommentVo subCommentVo) {
        Long commentId = subCommentVo.getCommentId();
        Comment comment = commentService.getById(commentId);
        User user = userService.getById(subCommentVo.getFromUid());
        if(comment == null || user == null) {
            return Result.failed(ResultEnum.COMMENT_NOT_EXIST);
        }
        boolean add = commentService.addSubComment(subCommentVo, user);
        if (!add) {
            return Result.failed(ResultEnum.FAILED);
        }
        return Result.success();
    }


    @ApiOperation("删除一级评论")
    @GetMapping("/del-subcomment")
    public Result<?> deleteComment(@RequestParam("commentId") Long commentId) {
        Comment comment = commentService.getById(commentId);
        if(comment == null) {
            return Result.success(ResultEnum.COMMENT_NOT_EXIST);
        }
        comment.setDeleted(DELETE_STATUS);
        // FIXME 这里级联删除二级评论暂时用触发器完成
        boolean update = commentService.updateById(comment);
        if(!update) {
            return Result.failed(ResultEnum.FAILED);
        }
        return Result.success();
    }
}
