package com.hallth.controller;

import com.hallth.domain.SysDictionary;
import com.hallth.domain.User;
import com.hallth.service.impl.SystemDictionaryServiceImpl;
import com.hallth.service.impl.UserServiceImpl;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/dict")
public class DictionaryController {

    @Resource
    private SystemDictionaryServiceImpl systemDictionaryService;

    @RequestMapping(value="/getDictList", method = {RequestMethod.GET, RequestMethod.POST})
    public Map<String, Object> getDictList(HttpServletRequest request, Model model){
        User loginUser = (User)request.getSession().getAttribute("loginUserInfo");
        model.addAttribute("loginUser", loginUser);
        int currentPage = Integer.parseInt(request.getParameter("page"));
        int pageSize = Integer.parseInt(request.getParameter("limit"));
        Map<String, Object> map = systemDictionaryService.getDictList(currentPage, pageSize);
        return map;
    }

    @RequestMapping(value="/getDictDetails/{type}", method = {RequestMethod.GET, RequestMethod.POST})
    public Map<String, Object> getDictDetails(@PathVariable("type")String type, HttpServletRequest request, Model model){
        User loginUser = (User)request.getSession().getAttribute("loginUserInfo");
        model.addAttribute("loginUser", loginUser);
        SysDictionary sysDictionary = new SysDictionary();
        sysDictionary.setType(type);
        Map<String, Object> map = systemDictionaryService.getDictDetails(sysDictionary);
        return map;
    }

    @RequestMapping(value="/getDictValue", method = {RequestMethod.GET, RequestMethod.POST})
    public Map<String, Object> getDictValue(SysDictionary sysDictionary, HttpServletRequest request, Model model){
        sysDictionary.setDelFlag("0");
        sysDictionary.setIsAvailable("1");
        String value = systemDictionaryService.getDictValue(sysDictionary);
        Map<String, Object> map = new HashMap<>();
        map.put("data", value);
        return map;
    }

    @RequestMapping(value="/getDictValue/{type}/{key}", method = {RequestMethod.GET, RequestMethod.POST})
    public Map<String, Object> getDictValue(@PathVariable("type")String type, @PathVariable("key")String key, HttpServletRequest request, Model model){
        SysDictionary sysDictionary = new SysDictionary();
        sysDictionary.setType(type);
        sysDictionary.setKey(key);
        sysDictionary.setDelFlag("0");
        sysDictionary.setIsAvailable("1");
        String value = systemDictionaryService.getDictValue(sysDictionary);
        Map<String, Object> map = new HashMap<>();
        map.put("data", value);
        return map;
    }

    @RequestMapping(value="/getDictKey/{type}/{value}", method = {RequestMethod.GET, RequestMethod.POST})
    public String getDictKey(@PathVariable("type")String type, @PathVariable("value")String value, HttpServletRequest request, Model model){
        SysDictionary sysDictionary = new SysDictionary();
        sysDictionary.setType(type);
        sysDictionary.setValue(value);
        sysDictionary.setDelFlag("0");
        sysDictionary.setIsAvailable("1");
        return systemDictionaryService.getDictKey(sysDictionary);
    }
}
