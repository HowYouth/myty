package com.hallth.domain;

import lombok.Data;

@Data
public class User{
    private int id;
    private String loginName;
    private String password;
    private String userName;
    private String gender;

    private String passwordConfirm;
}
