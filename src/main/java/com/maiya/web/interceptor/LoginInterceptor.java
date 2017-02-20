package com.maiya.web.interceptor;

import com.maiya.utils.CookiesUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by beck on 2016/11/16.
 */
public class LoginInterceptor extends HandlerInterceptorAdapter {
    Logger logger= LoggerFactory.getLogger(LoginInterceptor.class);
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (CookiesUtil.getCookie(request, "loginInfo") != null) {
            logger.info("come in");
            return true;
        }
        request.getRequestDispatcher("/WEB-INF/statics/views/login.jsp").forward(request, response);
        return false;
    }
}
