package com.hallth.controller;

import com.hallth.domain.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/page")
public class PageJumpController {

    @RequestMapping(value="/top", method = {RequestMethod.GET, RequestMethod.POST})
    public String top(HttpServletRequest request, Model model){
        User loginUser = (User)request.getSession().getAttribute("loginUserInfo");
        model.addAttribute("loginUser", loginUser);
        return "frame/top";
    }

    @RequestMapping(value="/toUserList", method = {RequestMethod.GET, RequestMethod.POST})
    public String toUserList(HttpServletRequest request, Model model){
        model.addAttribute("pageFlag", "userList");
        return "userManage/userManage";
    }

    @RequestMapping(value="/toDictionaryList", method = {RequestMethod.GET, RequestMethod.POST})
    public String toDictionaryList(HttpServletRequest request, Model model){
        model.addAttribute("pageFlag", "dictList");
        return "dictionaryManage/dictionaryManage";
    }

    @RequestMapping(value="/toSystemList", method = {RequestMethod.GET, RequestMethod.POST})
    public String toSystemList(HttpServletRequest request, Model model){
        model.addAttribute("pageFlag", "sysList");
        return "systemManage/systemManage";
    }

    @RequestMapping(value="/toTargetList", method = {RequestMethod.GET, RequestMethod.POST})
    public String toTargetList(HttpServletRequest request, Model model){
        model.addAttribute("pageFlag", "targetList");
        return "targetManage/targetManage";
    }

    @RequestMapping(value="/toMenuList", method = {RequestMethod.GET, RequestMethod.POST})
    public String toMenuList(HttpServletRequest request, Model model){
        model.addAttribute("pageFlag", "menuList");
        return "menuManage/menuManage";
    }

    @RequestMapping(value="/toDictDetails/{type}/{description}", method = {RequestMethod.GET, RequestMethod.POST})
    public String toDictDetails(@PathVariable("type")String type,@PathVariable("description")String description, HttpServletRequest request, Model model){
        model.addAttribute("pageFlag", "menuList");
        model.addAttribute("type", type);
        model.addAttribute("description", description);
        return "dictionaryManage/dictionaryDetails";
    }
}
