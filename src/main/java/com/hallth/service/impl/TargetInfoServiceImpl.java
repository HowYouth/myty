package com.hallth.service.impl;

import com.hallth.domain.TargetInfo;
import com.hallth.domain.User;
import com.hallth.mapper.TargetInfoMapper;
import com.hallth.queryEntry.UserQueryEntry;
import com.hallth.service.TargetInfoService;
import com.hallth.utils.JDBCUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TargetInfoServiceImpl implements TargetInfoService {
    @Resource
    private TargetInfoMapper targetInfoMapper;
    @Override
    public Map<String, Object> getTargetList(int currentPage, int pageSize) {
        TargetInfo targetInfo = new TargetInfo();
        targetInfo.setStartRow(JDBCUtils.getStartRow(currentPage, pageSize));
        targetInfo.setPageSize(pageSize);
        List<TargetInfo> list = targetInfoMapper.getTargetList(targetInfo);
        int total = targetInfoMapper.getCountTargetList(targetInfo);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count",total);
        map.put("data",list);
        return map;
    }
}
