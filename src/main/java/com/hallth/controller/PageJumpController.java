package com.hallth.controller;

import com.hallth.domain.SystemInfo;
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
        SystemInfo systemInfo = (SystemInfo)request.getSession().getAttribute("systemInfo");
        model.addAttribute("loginUser", loginUser);
        model.addAttribute("systemInfo", systemInfo);
        return "frame/top";
    }

    @RequestMapping(value="/left/{parentId}", method = {RequestMethod.GET, RequestMethod.POST})
    public String left(@PathVariable("parentId") String parentId, HttpServletRequest request, Model model){
        model.addAttribute("parentId", parentId);
        return "frame/left";
    }

    @RequestMapping(value="/toUserList", method = {RequestMethod.GET, RequestMethod.POST})
    public String toUserList(HttpServletRequest request, Model model){
        model.addAttribute("topPageFlag", "userList");
        model.addAttribute("leftPageFlag", "userList");
        model.addAttribute("menuId", request.getParameter("menuId") == null ? "1" : request.getParameter("menuId"));
        return "userManage/userManage";
    }

    @RequestMapping(value="/toDictionaryList", method = {RequestMethod.GET, RequestMethod.POST})
    public String toDictionaryList(HttpServletRequest request, Model model){
        model.addAttribute("topPageFlag", "dictList");
        model.addAttribute("menuId", request.getParameter("menuId"));
        return "dictionaryManage/dictionaryManage";
    }

    @RequestMapping(value="/toSystemList", method = {RequestMethod.GET, RequestMethod.POST})
    public String toSystemList(HttpServletRequest request, Model model){
        model.addAttribute("topPageFlag", "sysList");
        model.addAttribute("menuId", request.getParameter("menuId"));
        return "systemManage/systemManage";
    }

    @RequestMapping(value="/toTargetList", method = {RequestMethod.GET, RequestMethod.POST})
    public String toTargetList(HttpServletRequest request, Model model){
        model.addAttribute("topPageFlag", "targetList");
        model.addAttribute("menuId", request.getParameter("menuId"));
        return "targetManage/targetManage";
    }

    @RequestMapping(value="/toMenuList", method = {RequestMethod.GET, RequestMethod.POST})
    public String toMenuList(HttpServletRequest request, Model model){
        model.addAttribute("topPageFlag", "menuList");
        model.addAttribute("menuId", request.getParameter("menuId"));
        return "menuManage/menuManage";
    }

    @RequestMapping(value="/toDictDetails/{type}/{description}", method = {RequestMethod.GET, RequestMethod.POST})
    public String toDictDetails(@PathVariable("type")String type,@PathVariable("description")String description, HttpServletRequest request, Model model){
        model.addAttribute("topPageFlag", "dictList");
        model.addAttribute("leftPageFlag", "dictEdit");
        model.addAttribute("type", type);
        model.addAttribute("description", description);
        model.addAttribute("menuId", request.getParameter("menuId"));
        return "dictionaryManage/dictionaryDetails";
    }

    @RequestMapping(value="/toUserAdd", method = {RequestMethod.GET, RequestMethod.POST})
    public String toUserAdd(HttpServletRequest request, Model model){
        model.addAttribute("topPageFlag", "userList");
        model.addAttribute("leftPageFlag", "userAdd");
        model.addAttribute("menuId", request.getParameter("menuId"));
        return "userManage/userAdd";
    }
}
