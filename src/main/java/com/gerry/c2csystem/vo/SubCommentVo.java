package com.gerry.c2csystem.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 子评论展示层对象
 *
 * @author Gerry
 * @email sjiahui@gmail.com
 * @since 2022/6/3 13:59
 **/

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SubCommentVo {
    /**
     * 评论 ID
     */
    private Long commentId;

    /**
     * 评论用户 ID
     */
    private Long fromUid;

    /**
     * 评论用户昵称
     */
    private String fromNickName;

    /**
     * 目标用户 ID
     */
    private Long targetUid;

    /**
     * 回复内容
     */
    private String content;
}
