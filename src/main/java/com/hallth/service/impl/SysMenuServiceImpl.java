package com.hallth.service.impl;

import com.hallth.domain.SysMenu;
import com.hallth.domain.User;
import com.hallth.mapper.SysMenuMapper;
import com.hallth.queryEntry.UserQueryEntry;
import com.hallth.service.SysMenuService;
import com.hallth.utils.JDBCUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SysMenuServiceImpl implements SysMenuService {
    @Resource
    private SysMenuMapper sysMenuMapper;

    @Override
    public Map<String, Object> getMenuList(int currentPage, int pageSize) {
        SysMenu sysMenu = new SysMenu();
        sysMenu.setStartRow(JDBCUtils.getStartRow(currentPage, pageSize));
        sysMenu.setPageSize(pageSize);
        List<SysMenu> list = sysMenuMapper.getMenuList(sysMenu);
        int total = sysMenuMapper.getCountMenuList(sysMenu);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count",total);
        map.put("data",list);
        return map;
    }
}
