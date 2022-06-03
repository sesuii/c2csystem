package com.gerry.c2csystem.vo;

import com.gerry.c2csystem.entity.SubComment;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

/**
 * 评论展示层对象
 *
 * @author Gerry
 * @email sjiahui@gmail.com
 * @since 2022/6/3 10:46
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommentVo {
    private static final long serialVersionUID = 1L;

    /**
     * 主键 ID
     */
    private Long id;

    /**
     * 评论者 ID
     */
    private Long fromUid;

    /**
     * 所属商品 ID
     */
    private Long goodsId;

    /**
     * 用户昵称
     */
    private String nickName;

    /**
     * 用户头像
     */
    private String userImg;

    /**
     * 评论内容
     */
    private String content;

    /**
     * 创建时间
     */
    private Date gmtCreate;

    /**
     * 逻辑删除
     */
    private Integer deleted;

    /**
     * 所包含的二级评论
     **/
    private List<SubComment> subCommentList;

}
