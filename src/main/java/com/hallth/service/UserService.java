package com.hallth.service;

import com.hallth.domain.User;

import java.util.Map;

public interface UserService {
    User loginCheck(User user);

    User getById(String userId);

    Map<String, Object> getUserList(int currentPage, int pageSize);
}
