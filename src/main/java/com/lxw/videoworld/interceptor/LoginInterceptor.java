package com.lxw.videoworld.interceptor;

import com.lxw.videoworld.config.Constants;
import com.lxw.videoworld.dao.UserDao;
import com.lxw.videoworld.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {


    @Autowired
    private UserDao userDao;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        System.out.println("LoginInterceptor -- preHandle " + request.getRequestURL().toString());


        /* 重定向 死循环问题    -- - -- 过滤掉 login  界面   */
        Object user = request.getSession().getAttribute(Constants.USER_SESSION_KEY);
        if (user == null && !request.getRequestURL().toString().contains("login")) {


            System.out.println("检测 cookie 实现 自动登录功能  start");

            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                String userName = "";
                String password = "";


                for (Cookie cookie : cookies) {
                     System.out.println("domain - "+ cookie.getDomain());
                     System.out.println("domain - "+ cookie.getPath());
                     System.out.println("domain - "+ cookie.getMaxAge());

                    if ("userName".equals(cookie.getName())) {
                        userName = cookie.getValue();
                    }
                    if ("password".equals(cookie.getName())) {
                        password = cookie.getValue();
                    }
                }

                if (!"".equals(userName) && !"".equals(password)) {
                    User user1 = userDao.findOneByNamePwd(userName, password);

                    if (user1 != null) {
                        request.getSession().setAttribute(Constants.USER_SESSION_KEY, user1);

                        return true;
                    }


                }


            }


            System.out.println("检测 cookie 实现 自动登录功能  end");


            System.out.println("尚未登录，调到登录页面");
            response.sendRedirect("../toLogin");


            return false;
        }


        return true;
    }


    /**
     * 这个方法只会在当前这个Interceptor的preHandle方法返回值为true的时候才会执行。postHandle是进行处理器拦截用的，它的执行时间是在处理器进行处理之
     * 后，也就是在Controller的方法调用之后执行，但是它会在DispatcherServlet进行视图的渲染之前执行，也就是说在这个方法中你可以对ModelAndView进行操
     * 作。这个方法的链式结构跟正常访问的方向是相反的，也就是说先声明的Interceptor拦截器该方法反而会后调用，这跟Struts2里面的拦截器的执行过程有点像，
     * 只是Struts2里面的intercept方法中要手动的调用ActionInvocation的invoke方法，Struts2中调用ActionInvocation的invoke方法就是调用下一个Interceptor
     * 或者是调用action，然后要在Interceptor之前调用的内容都写在调用invoke之前，要在Interceptor之后调用的内容都写在调用invoke方法之后。
     */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        System.out.println("postHandle---- session id is = " + request.getSession().getId());


    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        System.out.println("afterCompletion");
    }

}
