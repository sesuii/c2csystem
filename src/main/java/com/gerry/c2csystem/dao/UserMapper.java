package com.gerry.c2csystem.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.gerry.c2csystem.entity.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * <p>
 * 用户表 Mapper 接口
 * </p>
 *
 * @author Gerry
 * @since 2022-05-21
 */
public interface UserMapper extends BaseMapper<User> {

    @Select("select * from user where id = #{id}")
    User selectUserById(@Param("id") Long id);
}
