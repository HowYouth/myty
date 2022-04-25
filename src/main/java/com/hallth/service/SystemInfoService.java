package com.hallth.service;

import com.hallth.domain.SystemInfo;
import com.hallth.domain.User;

import java.util.List;
import java.util.Map;

public interface SystemInfoService {
    List<SystemInfo> queryAvailalbeSystemList(User user);

    SystemInfo selectByPrimaryKey(Integer systemId);

    Map<String, Object> getSystemList(int currentPage, int pageSize);
}
