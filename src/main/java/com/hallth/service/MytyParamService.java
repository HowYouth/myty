package com.hallth.service;

import com.hallth.domain.MytyParam;

import java.util.Map;

public interface MytyParamService {

    int insertParam(MytyParam param);

    Map getAllParam(int currentPage, int pageSize);

    int updateParam(MytyParam param);

    int deleteParam(MytyParam param);

}
