package com.hallth.domain;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Setter
@Getter
public class JSONBean {
    private String id;
    private String text;
    private List<JSONBean> children;
    private String state;
}
