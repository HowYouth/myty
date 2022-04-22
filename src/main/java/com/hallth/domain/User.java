package com.hallth.domain;

import com.hallth.system.BaseEntry;
import lombok.Data;

@Data
public class User{
    private Integer id;
    private String loginName;
    private String password;
    private String userName;
    private String gender;
}
