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

    @Override
    public Map<String, Object> getDictDetails(SysDictionary sysDictionary) {
        List<SysDictionary> list = sysDictionaryMapper.getDictDetails(sysDictionary);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "");
//        map.put("count",total);
        map.put("data",list);
        return map;
    }

    @Override
    public String getDictValue(SysDictionary sysDictionary) {
        return sysDictionaryMapper.getDictValue(sysDictionary);
    }

    @Override
    public String getDictKey(SysDictionary sysDictionary) {
        return sysDictionaryMapper.getDictKey(sysDictionary);
    }

    @Override
    public Map<String, Object> updateIfNotNull(SysDictionary sysDictionary) {
        Map<String, Object> map = new HashMap<>();
        try{
            int res = sysDictionaryMapper.updateByPrimaryKeySelective(sysDictionary);
            map.put("success", true);
        } catch (Exception e){
            map.put("success", false);
            map.put("errorMsg", e.getMessage());
        }
        return map;
    }

    @Override
    public Map<String, Object> deleteDict(SysDictionary sysDictionary) {
        Map<String, Object> map = new HashMap<>();
        try{
            int res = sysDictionaryMapper.deleteDict(sysDictionary);
            map.put("success", true);
        } catch (Exception e){
            map.put("success", false);
            map.put("errorMsg", e.getMessage());
        }
        return map;
    }

    @Override
    public Map<String, Object> deleteKey(SysDictionary sysDictionary) {
        Map<String, Object> map = new HashMap<>();
        try{
            sysDictionary.setDelFlag(sysDictionary.getDelFlag().equals("1")? "0" : "1");
            int res = sysDictionaryMapper.deleteKey(sysDictionary);
            map.put("success", true);
        } catch (Exception e){
            map.put("success", false);
            map.put("errorMsg", e.getMessage());
        }
        return map;
    }
}
