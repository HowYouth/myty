package com.hallth.service;

import com.hallth.domain.User;

import java.util.Map;

public interface UserService {
    User loginCheck(User user);

    User getById(int userId);

    Map<String, Object> getUserList(int currentPage, int pageSize);

    Map<String, Object> addUser(User user);

    Map<String, Object> updateIfNotNull(User user);
}
