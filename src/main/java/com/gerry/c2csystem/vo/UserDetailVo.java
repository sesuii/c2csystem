package com.gerry.c2csystem.vo;

import com.gerry.c2csystem.entity.User;
import com.gerry.c2csystem.entity.UserDetail;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 用户详细信息展示层对象
 *
 * @author Gerry
 * @email sjiahui@gmail.com
 * @since 2022/5/28 16:50
 **/

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserDetailVo {
    private User user;
    private UserDetail userDetail;
}
