package com.gerry.c2csystem.controller;

import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
    // TODO 发表一级评论
    // TODO 发表二级评论
    // 以上两个接口是不是能合并？
    // TODO 删除评论
}
