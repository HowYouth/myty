package com.hallth.controller;

import com.hallth.common.SysDictUtils;
import com.hallth.domain.User;
import com.hallth.service.impl.UserServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    private UserServiceImpl userService;
    @Resource
    private PageJumpController pageJumpController;

    @RequestMapping(value="/getUserList", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public Map<String, Object> getUserList(HttpServletRequest request, Model model){
        User loginUser = (User)request.getSession().getAttribute("loginUserInfo");
        model.addAttribute("loginUser", loginUser);
        int currentPage = Integer.parseInt(request.getParameter("page"));
        int pageSize = Integer.parseInt(request.getParameter("limit"));
        model.addAttribute("genderList", SysDictUtils.getDictDetailList("GENDER"));
        Map<String, Object> map = userService.getUserList(currentPage, pageSize);
        return map;
    }

    @RequestMapping(value="/userAdd", method = {RequestMethod.GET, RequestMethod.POST})
    public String userAdd(User user, HttpServletRequest request, Model model){
        Map<String, Object> map = userService.addUser(user);
        return pageJumpController.toUserList(request, model);
    }

    @RequestMapping(value="/edit", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public Map<String, Object> edit(User user, HttpServletRequest request, Model model){
        Map<String, Object> map = userService.updateIfNotNull(user);
        return map;
    }
}
