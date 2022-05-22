package com.gerry.c2csystem.util;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * jwt 工具类
 *
 * @author Gerry
 * @email sjiahui27@gmail.com
 * @date 2022/5/21 21:00
 **/
public class JwtUtil {
    /**
     * 生成 jwt
     * 使用 HS256 算法, 私匙使用固定秘钥 '123456'
     *
     * @param subject 加密信息
     * @return Token
     */
    public static String createJWT(String subject) {
        // 生成 JWT 的时间
        long nowMillis = System.currentTimeMillis();
        Date now = new Date(nowMillis);
        Map<String, Object> claims = new HashMap<>(16);
        claims.put("token", subject);
        JwtBuilder builder = Jwts.builder()
                .setClaims(claims)
                .setId(UUID.randomUUID().toString())
                .setIssuedAt(now)
                .setSubject(subject)
//                .setExpiration(new Date(nowMillis + RedisConstant.TOKEN_EXPIRE_TIME))
                .signWith(SignatureAlgorithm.HS256, "123456");
        return builder.compact();
    }

    /**
     * Token的解密
     *
     * @param token 加密后的 token
     * @return
     */
    public static Claims parseJWT(String token) {
        return Jwts.parser()
                .setSigningKey("123456")
                .parseClaimsJws(token).getBody();
    }
}