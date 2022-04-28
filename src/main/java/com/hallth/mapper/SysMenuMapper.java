package com.hallth.mapper;

import com.hallth.domain.SysMenu;

import java.util.List;

public interface SysMenuMapper {
    List<SysMenu> getMenuList(SysMenu sysMenu);
    List<SysMenu> getChildrenMenuList(SysMenu sysMenu);

    int getCountMenuList(SysMenu sysMenu);


}
