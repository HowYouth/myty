package com.hallth.system;

import com.hallth.domain.User;
import lombok.Data;

import java.util.Date;

@Data
public class BaseEntry {
    private Integer id;
    private String delFlag;
    private String isNewRecord;
    private Date createDate;
    private Date updateDate;
    private User createBy;
    private User updateBy;
}
