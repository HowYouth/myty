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
    public User getById(int userId) {
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

    @Override
    public Map<String, Object> addUser(User user) {
        Map<String, Object> map = new HashMap<>();
        try{
            int nextId = sysUserMapper.getNextId();
            user.setId(nextId);
            sysUserMapper.insert(user);
            map.put("path", "/page/toUserList");
            map.put("success", true);
            map.put("errorMsg","用户新增成功");
        } catch (Exception e){
            map.put("success", false);
            map.put("errorMsg",e.getMessage());
        }
        return map;
    }

    @Override
    public Map<String, Object> updateIfNotNull(User user) {
        Map<String, Object> map = new HashMap<>();
        try{
            sysUserMapper.updateIfNotNull(user);
            map.put("success", true);
            map.put("errorMsg","用户修改成功");
        } catch (Exception e){
            map.put("success", false);
            map.put("errorMsg",e.getMessage());
        }
        return map;
    }
}
