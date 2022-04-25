package com.hallth.queryEntry;

import lombok.Data;

@Data
public class UserQueryEntry {
    private Integer id;
    private String loginName;
    private String password;
    private String userName;
    private String gender;

    private int startRow;
    private int pageSize;
}
