package com.gerry.c2csystem.filter;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.gerry.c2csystem.util.JwtUtil;
import io.jsonwebtoken.Claims;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.OncePerRequestFilter;

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
public class AuthenticationFilter extends OncePerRequestFilter {

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

    }
}
