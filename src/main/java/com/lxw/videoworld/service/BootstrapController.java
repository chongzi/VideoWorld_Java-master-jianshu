package com.lxw.videoworld.service;

import com.lxw.videoworld.config.Constants;
import com.lxw.videoworld.dao.UserDao;
import com.lxw.videoworld.domain.User;

import com.lxw.videoworld.utils.ResponseUtil;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class BootstrapController {


    @Autowired
    private UserDao userDao;

    //通过原因分析，造成问题有两个因素：1). 缺省转发， 2). view和path同名
    @RequestMapping(value = "toLogin", method = RequestMethod.GET)
    public String toLogin(Model model) {


        System.out.println("to  login jsp ");


        return "login";
    }


    @RequestMapping("sign_up")
    public String toSignUp() {
        return "sign_up";
    }

    @RequestMapping("sign_in")
    public String toSignIn() {
        return "sign_in";
    }


    @RequestMapping(value = "/user/toHome", method = RequestMethod.GET)
    public String toHome() {


        return "home";
    }


    //通过原因分析，造成问题有两个因素：1). 缺省转发， 2). view和path同名
    @RequestMapping(value = "doLogin", method = RequestMethod.POST)
    @ResponseBody
    public String doLogin(@Param("userName") String userName, @Param("password") String password, HttpServletRequest request, HttpServletResponse response) {


        User user = userDao.findOneByNamePwd(userName, password);
        System.out.println("login --- >  \n name = " + userName + "  pwd = " + password);

        String resopn = ResponseUtil.formatResponse((user == null ? "登录失败" : user));

        if (user != null) {
            request.getSession().setAttribute(Constants.USER_SESSION_KEY, user);

            Cookie cookie = new Cookie("userName", user.getUserName());
            cookie.setMaxAge(999999);
            Cookie cookie1 = new Cookie("password", user.getPassword());
            cookie1.setMaxAge(999999);

            response.addCookie(cookie);
            response.addCookie(cookie1);

            {
                if (request.getCookies() != null)
                    for (int i = 0; i < request.getCookies().length; i++) {
                        Cookie cookie2 = request.getCookies()[i];

                        System.out.println("【----cookie---】 \n  name = " + cookie2.getName() + " value = " + cookie2.getValue());
                        System.out.println("【----session  Id---】 \n  " + request.getSession().getId());

                    }
            }


        }

        System.out.println(user);
        return resopn;
    }

    @RequestMapping(value = "doLoginOut", method = RequestMethod.GET)
    @ResponseBody
    public String doLoginOut(HttpServletRequest request) {


        if (request.getSession().getAttribute(Constants.USER_SESSION_KEY) == null) {
            String respon = ResponseUtil.formatResponse("退出登录失败。您可能还未登录");
            return respon;
        } else {
            request.getSession().removeAttribute(Constants.USER_SESSION_KEY);
            String respon = ResponseUtil.formatResponse("退出登录成功");
            return respon;
        }


    }


    @RequestMapping(value = "doRegister", method = RequestMethod.POST)
    @ResponseBody
    public String doRegister(Model model, User usr) {
        System.out.println("before " + usr.toString());

        System.out.println(" user ---> " + usr);

        int time = userDao.add(usr);

        String resopn = ResponseUtil.formatResponse(usr);

        System.out.println("after " + usr.toString());


        return resopn;
    }


}
