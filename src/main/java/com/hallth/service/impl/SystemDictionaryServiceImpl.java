package com.hallth.service.impl;

import com.hallth.domain.SysDictionary;
import com.hallth.domain.User;
import com.hallth.mapper.SysDictionaryMapper;
import com.hallth.queryEntry.UserQueryEntry;
import com.hallth.service.SystemDictionaryService;
import com.hallth.utils.JDBCUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SystemDictionaryServiceImpl implements SystemDictionaryService {
    @Resource
    private SysDictionaryMapper sysDictionaryMapper;
    @Override
    public Map<String, Object> getDictList(int currentPage, int pageSize) {
        SysDictionary sysDictionary = new SysDictionary();
        sysDictionary.setStartRow(JDBCUtils.getStartRow(currentPage, pageSize));
        sysDictionary.setPageSize(pageSize);
        List<SysDictionary> list = sysDictionaryMapper.getDictList(sysDictionary);
        int total = sysDictionaryMapper.getCountDictList(sysDictionary);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count",total);
        map.put("data",list);
        return map;
    }
}
