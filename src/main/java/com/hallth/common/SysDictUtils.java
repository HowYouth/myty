package com.hallth.common;

import com.hallth.domain.SysDictionary;
import com.hallth.mapper.SysDictionaryMapper;

import java.util.List;

public class SysDictUtils {

    private static SysDictionaryMapper sysDictionaryMapper = SpringContextHolder.getBean(SysDictionaryMapper.class);

    public static String getDictValue(String type, String key){
        SysDictionary sysDictionary = new SysDictionary();
        sysDictionary.setType(type);
        sysDictionary.setKey(key);
        sysDictionary.setDelFlag("0");
        sysDictionary.setIsAvailable("1");
        return sysDictionaryMapper.getDictValue(sysDictionary);
    }

    public static String getValue(String type, String key) {
        SysDictionary sysDictionary = new SysDictionary();
        sysDictionary.setType(type);
        sysDictionary.setKey(key);
        sysDictionary.setDelFlag("0");
        sysDictionary.setIsAvailable("1");
        return sysDictionaryMapper.getDictValue(sysDictionary);
    }

    /**
     *
     * */
    public static List<SysDictionary> getDictDetailList(String type, String isAvailable){
        SysDictionary sysDictionary = new SysDictionary();
        sysDictionary.setType(type);
        sysDictionary.setIsAvailable(isAvailable);
        return sysDictionaryMapper.getDictDetailList(sysDictionary);
    }

    public static List<SysDictionary> getDictDetailList(String type){
        return getDictDetailList(type, "1");
    }
}
