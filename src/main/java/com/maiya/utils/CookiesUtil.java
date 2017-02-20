package com.maiya.utils;



import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by beck on 2016/3/10.
 */
public  class CookiesUtil {
    public static void addCookie(HttpServletResponse response,String cookieName,String cookieValue,int min){
        Cookie cookie=new Cookie(cookieName,cookieValue);
        cookie.setMaxAge(min * 60);
        cookie.setPath("/");
        response.addCookie(cookie);
    }
    public static Cookie getCookie(HttpServletRequest request,String cookieName) {
        Cookie[] cookies = request.getCookies();
        Cookie cookie=null;
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                if (cookieName.equals(cookies[i].getName())) {
                    cookie=cookies[i];
                }
            }
        }
        return cookie;
    }

}
