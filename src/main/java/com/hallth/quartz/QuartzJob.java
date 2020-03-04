package com.hallth.quartz;

import com.hallth.domain.MytyAgenda;
import com.hallth.domain.MytyLog;
import com.hallth.domain.MytyScore;
import com.hallth.domain.ScoreQueryBean;
import com.hallth.mapper.MytyAnswerMapper;
import com.hallth.mapper.MytyLogMapper;
import com.hallth.mapper.MytyScoreMapper;
import com.hallth.service.impl.MytyAgendaServiceImpl;
import org.apache.log4j.Logger;

import javax.annotation.Resource;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class QuartzJob {
    private static Logger logger = Logger.getLogger(QuartzJob.class.getName());

    @Resource
    private MytyAgendaServiceImpl agendaService;
    @Resource
    private MytyLogMapper logMapper;
    @Resource
    private MytyAnswerMapper answerMapper;
    @Resource
    private MytyScoreMapper scoreMapper;

    protected void countScore() throws ParseException {
        MytyAgenda agenda = agendaService.getNewAgenda();
        if(agenda != null){
            MytyLog log = new MytyLog();
            log.setAgendaRoundNo(agenda.getRoundNo());
            Date endTime = agenda.getEndTime();
            if (endTime.getTime() > System.currentTimeMillis()) {
                logger.info("没有要执行的计分任务");
            } else {
                Integer item = logMapper.selectByRoundNo(log);
                if (item == null || item == 0) {
                    //TODO: 计算本轮猜射得分情况
                    List<MytyScore> ansScoreList = countAnswerScore(log);
                    //TODO: 计算本轮制谜得分情况
                    List<MytyScore> subjectScoreList = countSubjectScore(log);
                    //TODO: 写入数据库
                    List<MytyScore> list = getAllScoreList(ansScoreList, subjectScoreList);
                    int a = insert(list);
                    //TODO: 插入日志
                    log.setOperTime(new Date());
                    log.setOperDesc("insert score");
                    if(a > 0){
                        addLog(log);
                    }
                } else {
                    logger.info("计分任务已完成");
                }
            }
        }
    }

    private List<MytyScore> getAllScoreList(List<MytyScore> ansScoreList, List<MytyScore> subjectScoreList) {
        List<MytyScore> list = new ArrayList<>();
        for(MytyScore ansScore : ansScoreList){
            String userIdAns = ansScore.getUserId();
            boolean flag = false;
            for(MytyScore subScore : subjectScoreList){
                String userIdSub = subScore.getUserId();
                if(userIdAns.equals(userIdSub)){
                    ansScore.setUserSubScore(subScore.getUserSubScore());
                    subjectScoreList.remove(subScore);
                    list.add(ansScore);
                    flag = true;
                    break;
                }
            }
            if(!flag){
                list.add(ansScore);
            }
        }
        if(subjectScoreList.size() > 0){
            list.addAll(subjectScoreList);
        }
        return list;
    }

    private void addLog(MytyLog log) {
        logMapper.insert(log);
    }

    private int insert(List<MytyScore> list) {
        int a = scoreMapper.insertList(list);
        logger.info("入库操作完成：" + a);
        //TODO: 入库操作
        return a;
    }

    private List<MytyScore> countSubjectScore(MytyLog log) {
        logger.info("开始计算第" + log.getAgendaRoundNo() + "轮制谜得分");
        List<MytyScore> res = answerMapper.getUserSubjectScoreDetail(log);
        return res;
    }

    private List<MytyScore> countAnswerScore(MytyLog log) {
        logger.info("开始计算第" + log.getAgendaRoundNo() + "轮猜射得分");
        List<ScoreQueryBean> userAnsInfo = answerMapper.getPlayerAnswerDetails(log);
        List<String> players = answerMapper.getAllPlayers(log);
        List<MytyScore> res = new ArrayList<>();
        for (String player : players) {
            int playerScore = 0;
            for (String p : players) {
                if (!p.equals(player)) {
                    //查询p的猜射情况
                    int pInfo = getUserAnsInfo(p, player, userAnsInfo);
                    // plater的猜射情况
                    int playerInfo = getUserAnsInfo(player, p, userAnsInfo);
                    if (playerInfo == pInfo) {
                        playerScore += 1;
                    } else if (playerInfo > pInfo) {
                        playerScore += 3;
                    } else {
                        playerScore += 0;
                    }
                }
            }
            MytyScore userAnswerScore = new MytyScore();
            userAnswerScore.setUserId(player);
            userAnswerScore.setUserAnsScore(playerScore);
            userAnswerScore.setAgendaRoundNo(log.getAgendaRoundNo());
            userAnswerScore.setScoreType("1");
            res.add(userAnswerScore);
        }
        return res;
    }

    //userId: 要获取猜射情况的用户
    //s: 要比较的用户
    private int getUserAnsInfo(String userId, String s, List<ScoreQueryBean> l){
        int sum = 0;
        for(ScoreQueryBean ss : l){
            if(ss.getUser_id().equals(userId) && !ss.getDm_author_id().equals(s)){
                sum = sum + ss.getRight_count();
            }
        }
        return sum;
    }
}
