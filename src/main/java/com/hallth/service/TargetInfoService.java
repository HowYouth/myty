package com.hallth.service;

import java.util.Map;

public interface TargetInfoService {
    Map<String, Object> getTargetList(int currentPage, int pageSize);
}
