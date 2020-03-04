package com.hallth.service.impl;

import com.hallth.domain.MytyParam;
import com.hallth.mapper.MytyParamMapper;
import com.hallth.service.MytyParamService;
import com.hallth.utils.DatabaseUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MytyParamServiceImpl implements MytyParamService {

    @Resource
    private MytyParamMapper paramMapper;

    @Override
    public int insertParam(MytyParam param) {
        return paramMapper.insert(param);
    }

    @Override
    public Map getAllParam(int currentPage, int pageSize) {
        MytyParam param = new MytyParam();
        param.setStartRow(DatabaseUtils.getStartRow(currentPage, pageSize));
        param.setPageSize(pageSize);
        List<MytyParam> list = paramMapper.getAllParam(param);
        int total = paramMapper.getAllParamCount(param);
        Map map = new HashMap();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", total);
        map.put("data", list);
        return map;
    }

    @Override
    public int updateParam(MytyParam param) {
        return paramMapper.updateParam(param);
    }

    @Override
    public int deleteParam(MytyParam param) {
        return paramMapper.deleteParam(param);
    }
}
