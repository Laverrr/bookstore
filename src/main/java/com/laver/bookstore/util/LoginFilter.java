package com.laver.bookstore.util;

/**
 * Created by L on 2018/1/9.
 */

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginFilter implements Filter {

    public void init(FilterConfig filterConfig) throws ServletException {
        // TODO Auto-generated method stub
    }

    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {
        // 获得在下面代码中要用的request,response,session对象
        HttpServletRequest servletRequest = (HttpServletRequest) request;
        HttpServletResponse servletResponse = (HttpServletResponse) response;
        HttpSession session = servletRequest.getSession();
        // 获得用户请求的URI
        String path = servletRequest.getRequestURI();
//        System.out.println(path);
        // 从session里取员信息
        String admin = (String) session.getAttribute("admin");
        //创建类Constants.java，里面写的是无需过滤的页面
        for (int i = 0; i < Constant.NoFilter_Pages.length; i++) {
            if (path.indexOf(Constant.NoFilter_Pages[i]) > -1) {
                chain.doFilter(servletRequest, servletResponse);
                return;
            }
        }
        // 登陆页面无需过滤
        if (path.indexOf("/backLoginPage.do") > -1) {
            chain.doFilter(servletRequest, servletResponse);
            return;
        }
        if (path.indexOf("/backLogin.do.do") > -1) {
            chain.doFilter(servletRequest, servletResponse);
            return;
        }

        // 判断如果没有取到员工信息,就跳转到登陆页面
        if (admin == null || "".equals(admin)) {
            // 跳转到登陆页面
            servletResponse.sendRedirect("/backLoginPage.do");
        } else {
            // 已经登陆,继续此次请求
            chain.doFilter(request, response);
        }
    }

    public void destroy() {
        // TODO Auto-generated method stub
    }
}
