package com.hallth.service.impl;

import com.hallth.domain.MytyMenu;
import com.hallth.domain.MytyUser;
import com.hallth.mapper.MytyMenuMapper;
import com.hallth.service.MytyMenuService;
import com.hallth.utils.DatabaseUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MytyMenuServiceImpl implements MytyMenuService {

    @Resource
    private MytyMenuMapper menuMapper;

    @Override
    public List<MytyMenu> getMenuListByUserRole(MytyMenu menu) {
        List<MytyMenu> list = menuMapper.getListByUserRole(menu);
        List<MytyMenu> returnList = new ArrayList<>();
        int index = menu.getMenuOrder().indexOf("1");
        for(MytyMenu item : list){
            String flag = item.getMenuOrder().substring(index,index + 1);
            if(flag.equals("1") || "0000".equals(item.getMenuOrder())){
                returnList.add(item);
            }
        }
        return returnList;
    }

    @Override
    public Map getAllMenu(int currentPage, int pageSize) {
        Map map = new HashMap();
        MytyMenu menu = new MytyMenu();
        menu.setPageSize(pageSize);
        menu.setStartRow(DatabaseUtils.getStartRow(currentPage, pageSize));
        List<MytyUser> list = menuMapper.getAllMenuInfo(menu);
        int inputCount = menuMapper.getAllMenuInfoCount(menu);
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", inputCount);
        map.put("data", list);
        return map;
    }

    @Override
    public int addMenu(MytyMenu menu) {
        return menuMapper.insert(menu);
    }

    @Override
    public int deleteMenu(MytyMenu menu) {
        return menuMapper.deleteMenu(menu);
    }
}
