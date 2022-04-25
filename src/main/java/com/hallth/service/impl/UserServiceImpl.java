package com.hallth.service.impl;

import com.hallth.domain.User;
import com.hallth.mapper.SysUserMapper;
import com.hallth.queryEntry.UserQueryEntry;
import com.hallth.service.UserService;
import com.hallth.utils.JDBCUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService{
    @Resource
    private SysUserMapper sysUserMapper;

    @Override
    public User loginCheck(User user) {
        return sysUserMapper.loginCheck(user);
    }

    @Override
    public User getById(String userId) {
        User user = new User();
        user.setId(userId);
        return sysUserMapper.getById(user);
    }

    @Override
    public Map<String, Object> getUserList(int currentPage, int pageSize) {
        UserQueryEntry userQueryEntry = new UserQueryEntry();
        userQueryEntry.setStartRow(JDBCUtils.getStartRow(currentPage, pageSize));
        userQueryEntry.setPageSize(pageSize);
        List<User> list = sysUserMapper.getUserList(userQueryEntry);
        int total = sysUserMapper.getCountUserList(userQueryEntry);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count",total);
        map.put("data",list);
        return map;
    }
}
