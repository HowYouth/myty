package com.hallth.service.impl;

import com.hallth.domain.*;
import com.hallth.mapper.MytyAnswerMapper;
import com.hallth.mapper.MytyUserMapper;
import com.hallth.service.MytyAnswerService;
import com.hallth.utils.DatabaseUtils;
import com.hallth.utils.UserScoreUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MytyAnswerServiceImpl implements MytyAnswerService {


    @Resource
    private MytyAnswerMapper answerMapper;
    @Resource
    private MytyUserMapper userMapper;

    @Resource
    private UserScoreUtils userScoreUtils;

    @Override
    public int saveMyAnswer(MytyAnswer answer, String flag) {
        if("I".equals(flag)){
            answerMapper.insert(answer);
        } else if("U".equals(flag)){
            answerMapper.updateMyAnswer(answer);
        } else if("UJ".equals(flag)){
            answerMapper.updateMyJudge(answer);
        }  else if("UR".equals(flag)){
            answerMapper.updateIsRight(answer);
        }
        return 0;
    }

    @Override
    public MytyAnswer getMyAnswer(MytyAnswer answer) {
        return answerMapper.selectAnswer(answer);
    }

    @Override
    public Map<String, Object> getInputAnswerCounts(MytyAgenda agenda) {
        List<SaikuangBean> list = answerMapper.getInputAnswerCounts(agenda);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count",0);
        map.put("data",list);
        return map;
    }

    @Override
    public Map<String, Object> getJudgeCounts(MytyAgenda agenda) {
        List<SaikuangBean> list = answerMapper.getJudgeCounts(agenda);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count",0);
        map.put("data",list);
        return map;
    }

    @Override
    public Map<String, Object> getScoreInfo(int roundNo, int currentPage, int pageSize) {
        MytyScore scoreQueryBean = new MytyScore();
        scoreQueryBean.setAgendaRoundNo(roundNo);
        scoreQueryBean.setStartRow(DatabaseUtils.getStartRow(currentPage, pageSize));
        scoreQueryBean.setPageSize(pageSize);
        List<MytyScore> userAnswerScoreList = userScoreUtils.getUserScoreList(scoreQueryBean);
        int total = userScoreUtils.getUserScoreListCount(scoreQueryBean);
        Map<String, Object> map = new HashMap<>();
//        map.put("code", 0);
//        map.put("msg", "");
//        map.put("count",total);
//        map.put("data",userAnswerScoreList);
        map.put("total",total);
        map.put("rows",userAnswerScoreList);
        return map;
    }

    @Override
    public Map<String, Object> getSubjectScoreInfo(int roundNo, int currentPage, int pageSize) {
        ScoreQueryBean scoreQueryBean = new ScoreQueryBean();
        scoreQueryBean.setAgenda_round_no(roundNo);
        scoreQueryBean.setStartRow(DatabaseUtils.getStartRow(currentPage, pageSize));
        scoreQueryBean.setPageSize(pageSize);
        List<ScoreQueryBean> list = answerMapper.getSubjectScoreInfo(scoreQueryBean);
        int total = answerMapper.getSubjectScoreInfoCount(scoreQueryBean);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count",total);
        map.put("data",list);
        return map;
    }

    @Override
    public Map<String, Object> getThisScoreInfo(int roundNo, int currentPage, int pageSize) {
        ScoreQueryBean scoreQueryBean = new ScoreQueryBean();
        scoreQueryBean.setAgenda_round_no(roundNo);
        scoreQueryBean.setStartRow(DatabaseUtils.getStartRow(currentPage, pageSize));
        scoreQueryBean.setPageSize(pageSize);
        List<ScoreQueryBean> list = answerMapper.getThisScoreInfo(scoreQueryBean);
        List<ScoreQueryBean> listReturn = new ArrayList<>();
        for(ScoreQueryBean item : list){
            int subjectScore = item.getUser_subject_score();
            int answerScore = item.getUser_answer_score();
            int sumScore = item.getSum_score();
            if(sumScore == 0){
                if(subjectScore > 0 || answerScore > 0){
                    sumScore = subjectScore + answerScore;
                }
            }
            item.setSum_score(sumScore);
            listReturn.add(item);
        }
        int total = answerMapper.getThisScoreInfoCount(scoreQueryBean);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count",total);
        map.put("data",listReturn);
        return map;
    }

    @Override
    public Map<String, Object> getCountScoreInfo(int currentPage, int pageSize) {
        ScoreQueryBean scoreQueryBean = new ScoreQueryBean();
        scoreQueryBean.setStartRow(DatabaseUtils.getStartRow(currentPage, pageSize));
        scoreQueryBean.setPageSize(pageSize);
        List<ScoreQueryBean> list = answerMapper.getCountScoreInfo(scoreQueryBean);
        int total = answerMapper.getCountScoreInfoCount(scoreQueryBean);
        Map<String, Object> map = new HashMap<>();
//        map.put("code", 0);
//        map.put("msg", "");
//        map.put("count",total);
//        map.put("data",list);
        map.put("total",total);
        map.put("rows",list);
        return map;
    }

    @Override
    public Map<String, Object> userScoreDetailTable(String userId) {
        ScoreQueryBean scoreQueryBean = new ScoreQueryBean();
        scoreQueryBean.setDm_author_id(userId);
        List<ScoreQueryBean> list = answerMapper.userScoreDetailTable(scoreQueryBean);
        Map <String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count",1);
        map.put("data",list);
        return map;
    }

    @Override
    public Map<String, Object> userAnswerDetailTable(String userId, int roundNo, int currentPage, int pageSize) {
        ScoreQueryBean scoreQueryBean = new ScoreQueryBean();
        scoreQueryBean.setUser_id(userId);
        scoreQueryBean.setAgenda_round_no(roundNo);
        scoreQueryBean.setStartRow(DatabaseUtils.getStartRow(currentPage, pageSize));
        scoreQueryBean.setPageSize(pageSize);
        List<ScoreQueryBean> list = answerMapper.userAnswerDetailTable(scoreQueryBean);
        int total = answerMapper.userAnswerDetailTableCount(scoreQueryBean);
        Map <String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", total);
        map.put("data",list);
        return map;
    }

    @Override
    public Map<String, Object> dengmiAnswerDetailTable(int dmId, int currentPage, int pageSize) {
        ScoreQueryBean param = new ScoreQueryBean();
        param.setDm_id(dmId);
        param.setStartRow(DatabaseUtils.getStartRow(currentPage, pageSize));
        param.setPageSize(pageSize);
        List<DengmiQueryBean> list = answerMapper.dengmiAnswerDetailTable(param);
        int total = answerMapper.dengmiAnswerDetailTableCount(param);
        Map <String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", total);
        map.put("data",list);
        return map;
    }
}
