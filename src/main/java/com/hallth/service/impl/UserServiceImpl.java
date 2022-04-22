package com.hallth.service.impl;

import com.hallth.domain.User;
import com.hallth.mapper.SysUserMapper;
import com.hallth.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
@Service
public class UserServiceImpl implements UserService {
    @Resource
    private SysUserMapper sysUserMapper;
    @Override
    public User loginCheck(User user) {
        return sysUserMapper.loginCheck(user);
    }
}
