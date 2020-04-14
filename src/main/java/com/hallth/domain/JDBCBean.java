package com.hallth.domain;

import lombok.Data;

import java.util.List;

@Data
public class JDBCBean {
    private List<String> colNameList;
    private boolean success;
    private String err_msg;
    private List<Object> data;
    private int count;
    private int total;
}
