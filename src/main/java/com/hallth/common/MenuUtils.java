package com.hallth.common;

import com.hallth.domain.SysMenu;
import com.hallth.mapper.SysMenuMapper;

import java.util.List;

public class MenuUtils {
    private static SysMenuMapper menuMapper = SpringContextHolder.getBean(SysMenuMapper.class);

    public static List<SysMenu> getChildrenMenuList(Integer parentId){
        SysMenu sysMenu = new SysMenu();
        sysMenu.setParentId(parentId);
        return menuMapper.getChildrenMenuList(sysMenu);
    }
}
