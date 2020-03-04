package com.hallth.service;

import com.hallth.domain.MytyUser;

import java.util.Map;

public interface MytyUserService {
    MytyUser loginCheck(MytyUser user);

    MytyUser getUserInfo(MytyUser user);

    int insert(MytyUser user);

    int changePassword(MytyUser user);

    Map getAllUserInfo(int currentPage, int pageSize);

    int resetPassword(String userId);

    int asDeveloper(String userId, int flag);
}
