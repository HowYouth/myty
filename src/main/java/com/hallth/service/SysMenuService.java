package com.hallth.service;

import java.util.Map;

public interface SysMenuService {
    Map<String, Object> getMenuList(int currentPage, int pageSize);
}
