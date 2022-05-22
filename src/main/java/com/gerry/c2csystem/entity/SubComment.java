package com.gerry.c2csystem.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 二级评论表
 * </p>
 *
 * @author Gerry
 * @since 2022-05-21
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class SubComment implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键 ID
     */
    private Long id;

    /**
     * 评论 ID
     */
    private Long commentId;

    /**
     * 评论用户 ID
     */
    private Long fromUid;

    /**
     * 目标用户 ID
     */
    private Long targetUid;

    /**
     * 回复内容
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


}
