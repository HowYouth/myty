package com.hallth.system;

import lombok.Data;
import java.util.List;

@Data
public class Page<T> {
    private int pageSize;
    private int pageNum;
    private int total;
    private List<T> dataList;
    private String errorMsg;
    private String errorCode;
}
