package com.gerry.c2csystem.util;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 获取 Web 相关对象
 *
 * @author Gerry
 * @email sjiahui@gmail.com
 * @since 2022/5/28 0:58
 **/
public class WebUtil {
    public static HttpServletRequest getRequest() {
        ServletRequestAttributes requestAttributes
                = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();

        return requestAttributes.getRequest();
    }

    public static HttpServletResponse getResponse() {
        ServletRequestAttributes requestAttributes
                = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();

        return requestAttributes.getResponse();
    }
}
