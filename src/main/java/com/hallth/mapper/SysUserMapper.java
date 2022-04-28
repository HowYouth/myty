package com.hallth.mapper;

import com.hallth.domain.User;
import com.hallth.queryEntry.UserQueryEntry;

import java.util.List;

public interface SysUserMapper {

    User loginCheck(User user);

    User getById(User user);

    List<User> getUserList(UserQueryEntry scoreQueryBean);

    int getCountUserList(UserQueryEntry scoreQueryBean);

    int getNextId();

    int insert(User user);

    int updateIfNotNull(User user);
}
