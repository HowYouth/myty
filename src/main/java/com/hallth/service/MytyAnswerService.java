package com.hallth.service;

import com.hallth.domain.MytyAgenda;
import com.hallth.domain.MytyAnswer;

import java.util.Map;

public interface MytyAnswerService {
    int saveMyAnswer(MytyAnswer answer, String flag);

    MytyAnswer getMyAnswer(MytyAnswer answer);

    Map<String, Object> getInputAnswerCounts(MytyAgenda agenda);

    Map<String, Object> getJudgeCounts(MytyAgenda agenda);

    Map<String, Object> getScoreInfo(int roundNo, int currentPage, int pageSize);

    Map<String, Object> getSubjectScoreInfo(int roundNo, int currentPage, int pageSize);

    Map<String, Object> getThisScoreInfo(int roundNo, int currentPage, int pageSize);

    Map<String, Object> getCountScoreInfo(int currentPage, int pageSize);

    Map<String, Object> userScoreDetailTable(String userId);

    Map<String, Object> userAnswerDetailTable(String userId, int roundNo, int currentPage, int pageSize);

    Map<String, Object> dengmiAnswerDetailTable(int dmId, int currentPage, int pageSize);
}
