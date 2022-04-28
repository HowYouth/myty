package com.hallth.domain;

import lombok.Data;

@Data
public class SysMenu {
    private int startRow;
    private int pageSize;

    private int id;
    private int sysId;
    private String sysName;
    private String menuName;
    private String menuIcon;
    private String menuUrl;
    private String remarks;
    private String hidden;
    private String hiddenCn;
    private String isAvailable;
    private String isAvailableCn;
    private int parentId;
    private String parentMenuName;
    private String menuFlag;
    private String parentMenuFlag;
}
