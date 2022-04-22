package com.hallth.controller;

import com.hallth.domain.User;
import com.hallth.service.impl.UserServiceImpl;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Calendar;

@Controller
@RequestMapping("/login")
public class LoginController {
    private static Logger logger = Logger.getLogger(LoginController.class.getName());

    @Resource
    private UserServiceImpl userService;

    @RequestMapping(value="/loginPage", method = {RequestMethod.GET, RequestMethod.POST})
    public String loginPage(HttpServletRequest request){
        String loginName = (String)request.getSession().getAttribute("loginUserName");
        if(loginName == null || "".equals(loginName)){
            return "login/login";
        } else {
            return "login/login";
        }
    }


    @RequestMapping(value="/loginCheck", method = {RequestMethod.GET, RequestMethod.POST})
    public String addUser(@RequestParam("userName")String userName, @RequestParam("userPassword")String userPassword,
                          HttpServletRequest request, Model model){
        logger.info("用户【" + userName + "】登录校验");
        User user = new User();
        user.setLoginName(userName);
        user.setPassword(userPassword);
        user = userService.loginCheck(user);
        if(user != null){
            logger.info("用户【" + userName + "】登录校验通过！");
            HttpSession session = request.getSession();
            session.setAttribute("loginUserName", userName);
            session.setAttribute("loginUserInfo", user);
            model.addAttribute("loginUser",user);
            return "login/choseSystem";
        } else {
            logger.info("用户【" + userName + "】不存在或密码错误！");
            model.addAttribute("errMsg","用户【" + userName + "】不存在或密码错误！");
            return "login/login";
        }
    }

    @RequestMapping(value="/loginOut", method = {RequestMethod.GET, RequestMethod.POST})
    public String loginOut(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.invalidate();//删除session
        return "login/login";
    }

}
