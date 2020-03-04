package com.hallth.service.impl;

import com.hallth.domain.MytyUser;
import com.hallth.mapper.MytyUserMapper;
import com.hallth.service.MytyUserService;
import com.hallth.utils.DatabaseUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MytyUserServiceImpl implements MytyUserService {

    @Resource
    private MytyUserMapper userMapper;
    @Override
    public MytyUser loginCheck(MytyUser user) {
        MytyUser userCheck = userMapper.loginCheck(user);
        return userCheck;
    }

    @Override
    public MytyUser getUserInfo(MytyUser user) {
        MytyUser userCheck = userMapper.getUserInfo(user);
        return userCheck;
    }

    @Override
    public int insert(MytyUser user) {
        return userMapper.insert(user);
    }

    @Override
    public int changePassword(MytyUser user) {
        return userMapper.changePassword(user);
    }

    @Override
    public Map getAllUserInfo(int currentPage, int pageSize) {
        Map map = new HashMap();
        MytyUser user = new MytyUser();
        user.setPageSize(pageSize);
        user.setStartRow(DatabaseUtils.getStartRow(currentPage, pageSize));
        List<MytyUser> list = userMapper.getAllUserInfo(user);
        int inputCount = userMapper.getAllUserInfoCount(user);
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", inputCount);
        map.put("data", list);
        return map;
    }

    @Override
    public int resetPassword(String userId) {
        MytyUser user = new MytyUser();
        user.setUserId(userId);
        user.setUserPassword("123456");
        return userMapper.resetPassword(user);
    }

    @Override
    public int asDeveloper(String userId, int flag) {
        MytyUser user = new MytyUser();
        user.setUserId(userId);
        user.setIsDeveloper(flag);
        return userMapper.asDeveloper(user);
    }
}
