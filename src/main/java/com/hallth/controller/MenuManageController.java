package com.hallth.controller;

import com.hallth.domain.MytyMenu;
import com.hallth.service.impl.MytyMenuServiceImpl;
import com.hallth.utils.SeqCreate;
import org.apache.log4j.Logger;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/menu")
public class MenuManageController {
    private static Logger logger = Logger.getLogger(MenuManageController.class.getName());

    @Resource
    private MytyMenuServiceImpl menuService;
    @Resource
    private SeqCreate seqCreate;

    @RequestMapping(value="/getAllMenu", method = {RequestMethod.GET, RequestMethod.POST})
    public Map getAllMenu(HttpServletRequest request){
        int currentPage = Integer.parseInt(request.getParameter("page"));
        int pageSize = Integer.parseInt(request.getParameter("limit"));
        return menuService.getAllMenu(currentPage, pageSize);
    }

    @RequestMapping(value = "/addMenu", method = {RequestMethod.GET, RequestMethod.POST})
    public Map addMenu(@RequestParam("menuName") String menuName, @RequestParam("menuPath") String menuPath, HttpServletRequest request, Model model) {
        logger.info("=========== 添加用户 ==========");
        Map map = new HashMap();
        MytyMenu menu = new MytyMenu();
        String menuId = seqCreate.getNextMenuId();
        if(menuPath.toLowerCase().startsWith("http://") || menuPath.toLowerCase().startsWith("https://")){

        } else {
            menuPath = "http://" + menuPath;
        }
        menu.setMenuPath(menuPath);
        menu.setMenuName(menuName);
        menu.setMenuOrder("0000");
        menu.setMenuRole("0");
        menu.setHasChildren(0);
        menu.setMenuType(2);
        menu.setParentMenu("0");
        menu.setMenuId(menuId);
        int i = menuService.addMenu(menu);
        if (i < 1) {
            model.addAttribute("errMsg", "菜单添加失败！");
            map.put("status", false);
            map.put("msg", "菜单添加失败");
        } else {
            model.addAttribute("errMsg", "菜单添加成功！");
            map.put("status", true);
            map.put("msg", "菜单添加成功");
        }
        return map;
    }

    @RequestMapping(value = "/deleteMenu", method = {RequestMethod.GET, RequestMethod.POST})
    public Map deleteMenu(HttpServletRequest request, Model model) {
        logger.info("=========== 删除菜单 ==========");
        Map map = new HashMap();
        String menuId = request.getParameter("menuId");
        MytyMenu menu = new MytyMenu();
        menu.setMenuId(menuId);
        int i = menuService.deleteMenu(menu);
        if (i < 1) {
            model.addAttribute("errMsg", "菜单删除失败！");
            map.put("status", false);
            map.put("msg", "菜单删除失败");
        } else {
            model.addAttribute("errMsg", "菜单删除成功！");
            map.put("status", true);
            map.put("msg", "菜单删除成功");
        }
        return map;
    }
}
