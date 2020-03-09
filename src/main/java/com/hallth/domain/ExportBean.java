package com.hallth.domain;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ExportBean {
    private String tabs;
    private String type;
    private String fanwei;
    private String roundNo;
    private int exportPageSize = 20;
    private int exportCurrentPage = 1;
}
