package com.hallth.controller;

import com.hallth.domain.User;
import com.hallth.service.impl.UserServiceImpl;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@RestController
@RequestMapping("/user")
public class UserController {

    @Resource
    private UserServiceImpl userService;

    @RequestMapping(value="/getUserList", method = {RequestMethod.GET, RequestMethod.POST})
    public Map<String, Object> getUserList(HttpServletRequest request, Model model){
        User loginUser = (User)request.getSession().getAttribute("loginUserInfo");
        model.addAttribute("loginUser", loginUser);
        int currentPage = Integer.parseInt(request.getParameter("page"));
        int pageSize = Integer.parseInt(request.getParameter("limit"));
        Map<String, Object> map = userService.getUserList(currentPage, pageSize);
        return map;
    }
}
