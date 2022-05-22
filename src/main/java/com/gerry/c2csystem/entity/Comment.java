package com.gerry.c2csystem.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 评论表
 * </p>
 *
 * @author Gerry
 * @since 2022-05-21
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class Comment implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键 ID
     */
    private Long id;

    /**
     * 所属商品 ID
     */
    private Long goodsId;

    /**
     * 评论者 ID
     */
    private Long fromUid;

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
     * 更新时间
     */
    private Date gmtUpdate;

    /**
     * 逻辑删除
     */
    private Integer deleted;


}
