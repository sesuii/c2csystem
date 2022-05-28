package com.gerry.c2csystem.service.impl;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gerry.c2csystem.constant.RedisConstant;
import com.gerry.c2csystem.dao.UserMapper;
import com.gerry.c2csystem.entity.User;
import com.gerry.c2csystem.service.IUserService;
import com.gerry.c2csystem.util.JwtUtil;
import com.gerry.c2csystem.vo.RegisterVo;
import com.gerry.c2csystem.vo.UserVo;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * <p>
 * 用户表 服务实现类
 * </p>
 *
 * @author Gerry
 * @since 2022-05-21
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

    @Resource
    IUserService userService;

    @Resource
    RedisTemplate<String, String> redisTemplate;

    @Resource
    AuthenticationManager authenticationManager;

    @Override
    public boolean createAccount(RegisterVo registerVo) {
        String email = registerVo.getEmail();
        String code = registerVo.getEmailCode();
        boolean checkCode = verifyCode(email, code);
        if(!checkCode) {
            return false;
        }
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        User user = User.builder()
                .nickName(registerVo.getUsername())
                .email(email)
                .role("USER")
                .gmtCreate(new Date())
                .password(encoder.encode(registerVo.getPassword()))
                .build();
        userService.save(user);
        return true;
    }

    @Override
    public Map<String, String> toLogin(User user) {
        UsernamePasswordAuthenticationToken authenticationToken =
                new UsernamePasswordAuthenticationToken(user.getEmail(), user.getPassword());
        Authentication authentication = authenticationManager.authenticate(authenticationToken);
        UserVo userVo = (UserVo) authentication.getPrincipal();
        redisTemplate.opsForValue().set(RedisConstant.USER_EMAIL_PREFIX + user.getEmail(),
                JSON.toJSONString(userVo), RedisConstant.TOKEN_EXPIRE_TIME, TimeUnit.SECONDS);
        String jwt = JwtUtil.createJWT(user.getId() + "");
        return Map.of("token", jwt);
    }

    /**
     * 对比用户填写的验证码和发送的验证码是否一致
     *
     * @param email 用户邮箱
     * @param code 用户填写的验证码
     * @return true 验证成功
     *
     **/
    private boolean verifyCode(String email, String code) {
        String redisCode = redisTemplate.opsForValue().get(RedisConstant.USER_EMAIL_PREFIX + email);
        return code.equals(redisCode);
    }
}
