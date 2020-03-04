package com.hallth.service;

import com.hallth.domain.MytyMenu;

import java.util.List;
import java.util.Map;

public interface MytyMenuService {
    List<MytyMenu> getMenuListByUserRole(MytyMenu menu);

    Map getAllMenu(int currentPage, int pageSize);

    int addMenu(MytyMenu menu);

    int deleteMenu(MytyMenu menu);
}
