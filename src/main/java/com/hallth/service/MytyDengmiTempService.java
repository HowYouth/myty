package com.hallth.service;

import com.hallth.domain.MytyAgenda;
import com.hallth.domain.MytyDengmiTemp;

import java.util.List;
import java.util.Map;

public interface MytyDengmiTempService {
    List<MytyDengmiTemp> selectByUserId(String loginUserId);

    List<MytyDengmiTemp> selectNoAnswers(String loginUserId);

    Map<String, Object> selectByUserIdPageQuery(int roundNo, String loginUserId, int currentPage, int pageSize);

    Map<String, Object> selectNoAnswersPageQuery(int roundNo, String loginUserId, int currentPage, int pageSize);

    int insertByList(List<MytyDengmiTemp> mySubjectList);

    MytyDengmiTemp selectDengmiByTempId(MytyDengmiTemp dengmiTemp);

    int insertSingle(MytyDengmiTemp dengmiTemp);

    int update(MytyDengmiTemp dengmiTemp);

    Map<String, Object> selectNoJudgePageQuery(int roundNo, String loginUserId, int currentPage, int pageSize);

    Map<String, Object> selectYidi(int roundNo, String loginUserId, int currentPage, int pageSize);

    Map<String, Object> getInputSubjectCounts(MytyAgenda agenda);

    Map<String, Object> getDengmiByRoundNo(Integer roundNo, int currentPage, int pageSize);

    Map<String, Object> getGoodSubjectByRoundNo(int roundNo);

    Map<String, Object> userCompetitionDetail(int roundNo, String userId, int currentPage, int pageSize);

    Map<String, Object> dengmiDetailTable(int dmId);
}
