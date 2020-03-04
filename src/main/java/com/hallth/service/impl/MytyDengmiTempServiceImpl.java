package com.hallth.service.impl;

import com.hallth.domain.*;
import com.hallth.mapper.MytyDengmiTempMapper;
import com.hallth.mapper.MytyParamMapper;
import com.hallth.service.MytyDengmiTempService;
import com.hallth.utils.DatabaseUtils;
import com.hallth.utils.SeqCreate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.transaction.Transactional;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MytyDengmiTempServiceImpl implements MytyDengmiTempService {

    @Resource
    private MytyDengmiTempMapper dengmiTempMapper;
    @Resource
    private MytyParamMapper paramMapper;

    @Resource
    private MytyAgendaServiceImpl agendaService;

    @Resource
    private SeqCreate seqCreate;

    @Override
    public List<MytyDengmiTemp> selectByUserId(String loginUserId) {
        MytyDengmiTemp dengmiTemp = new MytyDengmiTemp();
        dengmiTemp.setDmAuthor(loginUserId);
        List<MytyDengmiTemp> list = dengmiTempMapper.selectByUserId(dengmiTemp);
        return list;
    }

    @Override
    public List<MytyDengmiTemp> selectNoAnswers(String loginUserId) {
        MytyDengmiTemp dengmiTemp = new MytyDengmiTemp();
        dengmiTemp.setDmAuthor(loginUserId);
        List<MytyDengmiTemp> list = dengmiTempMapper.selectNoAnswers(dengmiTemp);
        return list;
    }

    @Override
    public Map<String, Object> selectByUserIdPageQuery(int roundNo, String loginUserId, int currentPage, int pageSize) {
        MytyDengmiTemp dengmiTemp = new MytyDengmiTemp();
        dengmiTemp.setDmAuthor(loginUserId);
        dengmiTemp.setPageSize(pageSize);
        dengmiTemp.setStartRow(DatabaseUtils.getStartRow(currentPage,pageSize));
        dengmiTemp.setAgendaRoundNo(roundNo);
        List<MytyDengmiTemp> list = dengmiTempMapper.selectByUserIdPageQuery(dengmiTemp);
        int total = dengmiTempMapper.selectByUserIdPageQueryCount(dengmiTemp);
        MytyAgenda agenda = agendaService.getNewAgenda();
        int inputCount = agenda.getInputCount();
        if(list == null || list.size() < inputCount){
            int addNull = inputCount - list.size();
            for(int i = 0; i < addNull; i ++){
                MytyDengmiTemp dengmi = createDengmiTemp();
                list.add(dengmi);
            }
        }
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count",total);
        map.put("data",list);
        return map;
    }

    public MytyDengmiTemp createDengmiTemp(){
        int dengmiTempId = seqCreate.getNextDengmiTempId();
        MytyDengmiTemp dengmi = new MytyDengmiTemp();
        dengmi.setDmTempId(dengmiTempId);
        return dengmi;
    }


    @Override
    public Map<String, Object> selectNoAnswersPageQuery(int roundNo, String loginUserId, int currentPage, int pageSize) {
        MytyDengmiTemp dengmiTemp = new MytyDengmiTemp();
        dengmiTemp.setDmAuthor(loginUserId);
        dengmiTemp.setPageSize(pageSize);
        dengmiTemp.setStartRow(DatabaseUtils.getStartRow(currentPage,pageSize));
        dengmiTemp.setAgendaRoundNo(roundNo);
        List<MytyDengmiTemp> list = dengmiTempMapper.selectNoAnswersPageQuery(dengmiTemp);
        int total = dengmiTempMapper.selectNoAnswersPageQueryCount(dengmiTemp);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count",total);
        map.put("data",list);
        return map;
    }

    @Override
    public int insertByList(List<MytyDengmiTemp> mySubjectList) {
        int i = dengmiTempMapper.insertByList(mySubjectList);
        return i;
    }

    @Override
    @Transactional()
    public MytyDengmiTemp selectDengmiByTempId(MytyDengmiTemp dengmiTemp) {
        return dengmiTempMapper.selectById(dengmiTemp);
    }

    @Override
    public int insertSingle(MytyDengmiTemp dengmiTemp) {
        return dengmiTempMapper.insert(dengmiTemp);
    }

    @Override
    public int update(MytyDengmiTemp dengmiTemp) {
        return dengmiTempMapper.update(dengmiTemp);
    }


    @Override
    public Map<String, Object> selectNoJudgePageQuery(int roundNo, String userId, int currentPage, int pageSize) {
        MytyDengmiTemp dengmiTemp = new MytyDengmiTemp();
        dengmiTemp.setDmAuthor(userId);
        dengmiTemp.setPageSize(pageSize);
        dengmiTemp.setStartRow(DatabaseUtils.getStartRow(currentPage,pageSize));
        dengmiTemp.setAgendaRoundNo(roundNo);
        List<MytyAnswerQueryBean> list = dengmiTempMapper.selectNoJudgePageQuery(dengmiTemp);
        int total = dengmiTempMapper.selectNoJudgePageQueryCount(dengmiTemp);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count",total);
        map.put("data",list);
        return map;
    }

    @Override
    public Map<String, Object> selectYidi(int roundNo, String loginUserId, int currentPage, int pageSize) {
        MytyDengmiTemp dengmiTemp = new MytyDengmiTemp();
        dengmiTemp.setDmAuthor(loginUserId);
        dengmiTemp.setPageSize(pageSize);
        dengmiTemp.setStartRow(DatabaseUtils.getStartRow(currentPage,pageSize));
        dengmiTemp.setAgendaRoundNo(roundNo);
        List<MytyAnswerQueryBean> list = dengmiTempMapper.selectYidi(dengmiTemp);
        int total = dengmiTempMapper.countYidi(dengmiTemp);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count",total);
        map.put("data",list);
        return map;
    }

    @Override
    public Map<String, Object> getInputSubjectCounts(MytyAgenda agenda) {
        List<SaikuangBean> list = dengmiTempMapper.getInputSubjectCounts(agenda);
        Map<String, Object> map = new HashMap<String, Object>();
//        map.put("code", 0);
//        map.put("msg", "");
//        map.put("count",0);
//        map.put("data",list);
        map.put("total",0);
        map.put("rows",list);
        return map;
    }

    @Override
    public Map<String, Object> getDengmiByRoundNo(Integer roundNo, int currentPage, int pageSize) {
        DengmiQueryBean queryBean = new DengmiQueryBean();
        queryBean.setAgenda_round_no(roundNo);
        queryBean.setStartRow(DatabaseUtils.getStartRow(currentPage, pageSize));
        queryBean.setPageSize(pageSize);
        List<DengmiQueryBean> list = dengmiTempMapper.getDengmiByRoundNo(queryBean);
        int total = dengmiTempMapper.getDengmiByRoundNoCount(queryBean);
        Map<String, Object> map = new HashMap<String, Object>();
//        map.put("code", 0);
//        map.put("msg", "");
//        map.put("count",total);
//        map.put("data",list);
        map.put("total",total);
        map.put("rows",list);
        return map;
    }

    @Override
    public Map<String, Object> getGoodSubjectByRoundNo(int roundNo) {
        DengmiQueryBean queryBean = new DengmiQueryBean();
        queryBean.setAgenda_round_no(roundNo);
        queryBean.setPageSize(Integer.parseInt(paramMapper.getValue("jiamishu")));
        List<DengmiQueryBean> list = dengmiTempMapper.getGoodSubjectByRoundNo(queryBean);
        Map<String, Object> map = new HashMap<String, Object>();
//        map.put("code", 0);
//        map.put("msg", "");
//        map.put("count",list.size());
//        map.put("data",list);
        map.put("total",list.size());
        map.put("rows",list);
        return map;
    }

    @Override
    public Map<String, Object> userCompetitionDetail(int roundNo, String userId, int currentPage, int pageSize) {
        ScoreQueryBean queryBean = new ScoreQueryBean();
        queryBean.setAgenda_round_no(roundNo);
        queryBean.setUser_id(userId);
        queryBean.setStartRow(DatabaseUtils.getStartRow(currentPage, pageSize));
        queryBean.setPageSize(pageSize);
        List<ScoreQueryBean> list = dengmiTempMapper.userCompetitionDetail(queryBean);
        int total = dengmiTempMapper.userCompetitionDetailCount(queryBean);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count",total);
        map.put("data",list);
        return map;
    }

    @Override
    public Map<String, Object> dengmiDetailTable(int dmId) {
        DengmiQueryBean dengmiQueryBean = new DengmiQueryBean();
        dengmiQueryBean.setDm_temp_id(dmId);
        List<DengmiQueryBean> list = dengmiTempMapper.dengmiDetailTable(dengmiQueryBean);
        Map <String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", list.size());
        map.put("data",list);
        return map;
    }
}
