package com.hallth.service.impl;

import com.hallth.domain.SystemInfo;
import com.hallth.domain.User;
import com.hallth.mapper.SysUserMapper;
import com.hallth.mapper.SystemInfoMapper;
import com.hallth.mapper.UserSystemRelMapper;
import com.hallth.queryEntry.UserQueryEntry;
import com.hallth.service.SystemInfoService;
import com.hallth.utils.JDBCUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SystemInfoServiceImpl  implements SystemInfoService {
    @Resource
    private UserSystemRelMapper userSystemRelMapper;
    @Resource
    private SystemInfoMapper systemInfoMapper;
    @Override
    public List<SystemInfo> queryAvailalbeSystemList(User user) {
        return userSystemRelMapper.queryAvailalbeSystemList(user);
    }

    @Override
    public SystemInfo selectByPrimaryKey(Integer systemId) {
        return systemInfoMapper.selectByPrimaryKey(systemId);
    }

    @Override
    public Map<String, Object> getSystemList(int currentPage, int pageSize) {
        SystemInfo systemInfo = new SystemInfo();
        systemInfo.setStartRow(JDBCUtils.getStartRow(currentPage, pageSize));
        systemInfo.setPageSize(pageSize);
        List<SystemInfo> list = systemInfoMapper.getSystemList(systemInfo);
        int total = systemInfoMapper.getCountSystemList(systemInfo);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count",total);
        map.put("data",list);
        return map;
    }
}
