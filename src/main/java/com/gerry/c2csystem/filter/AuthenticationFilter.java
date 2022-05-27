package com.gerry.c2csystem.filter;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.gerry.c2csystem.constant.RedisConstant;
import com.gerry.c2csystem.util.JwtUtil;
import com.gerry.c2csystem.vo.UserVo;
import io.jsonwebtoken.Claims;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.annotation.Resource;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


/**
 * 验证权限 拦截器
 * @author Gerry
 * @email sjiahui27@gmail.com
 * @date 2022/5/21 21:02
 **/
@Component
public class AuthenticationFilter extends OncePerRequestFilter {

    @Resource
    RedisTemplate<String, Object> redisTemplate;
    /**
     * 用户身份验证过滤器，最前端的认证授权拦截
     * 如果请求头未携带 Token 则放行。如果携带 Token，检验是否正确
     *
     * @param request
     * @param response
     * @param filterChain
     * @return
     *
     **/
    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        String token = request.getHeader("token");
        if(StringUtils.isEmpty(token)) {
            filterChain.doFilter(request, response);
            return;
        }
        Claims claims = JwtUtil.parseJWT(token);
        String uid = claims.getSubject();
        String s = (String) redisTemplate.opsForValue().get(RedisConstant.USER_ID_PREFIX + uid);
        UserVo userVo = JSON.parseObject(s, UserVo.class);
        if(userVo == null) {
            try {
                throw new Exception("用户未登录");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        UsernamePasswordAuthenticationToken authenticationToken =
                new UsernamePasswordAuthenticationToken(userVo, null, null);
        SecurityContextHolder.getContext().setAuthentication(authenticationToken);
        filterChain.doFilter(request, response);
    }
}
