package com.gerry.c2csystem.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 聊天记录表
 * </p>
 *
 * @author Gerry
 * @since 2022-05-21
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class ChatRecord implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 消息主键 ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 发送者 ID
     */
    private Long fromId;

    /**
     * 接收者 ID
     */
    private Long toId;

    /**
     * 接收者用户名
     */
    private String toName;

    /**
     * 发送者用户名
     */
    private String fromName;

    /**
     * 消息内容
     */
    private String content;

    /**
     * 创建时间
     */
    private Date gmtCreate;

    /**
     * 消息类型
     */
    private Long contentTypeId;

    /**
     * 是否已读 0未读 1已读
     */
    private Integer isRead;


}
