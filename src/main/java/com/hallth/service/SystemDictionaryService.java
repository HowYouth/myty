package com.hallth.service;

import com.hallth.domain.SysDictionary;

import java.util.Map;

public interface SystemDictionaryService {
    Map<String, Object> getDictList(int currentPage, int pageSize);

    Map<String, Object> getDictDetails(SysDictionary sysDictionary);

    String getDictValue(SysDictionary sysDictionary);

    String getDictKey(SysDictionary sysDictionary);
}
