package com.hallth.service;

import java.util.Map;

public interface SystemDictionaryService {
    Map<String, Object> getDictList(int currentPage, int pageSize);
}
