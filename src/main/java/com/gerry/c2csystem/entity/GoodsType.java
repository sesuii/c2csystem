package com.gerry.c2csystem.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 商品类别标签表
 * </p>
 *
 * @author Gerry
 * @since 2022-05-21
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class GoodsType implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键 ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 类别名称
     */
    private String typeName;

    /**
     * 权重
     */
    private Integer weight;

    /**
     * 创建时间
     */
    private Date gmtCreate;

    /**
     * 更新时间
     */
    private Date gmtUpdate;


}
