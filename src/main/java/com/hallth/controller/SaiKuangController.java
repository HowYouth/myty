package com.hallth.controller;

import com.hallth.domain.MytyAgenda;
import com.hallth.service.impl.MytyAgendaServiceImpl;
import com.hallth.service.impl.MytyAnswerServiceImpl;
import com.hallth.service.impl.MytyDengmiTempServiceImpl;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/saikuang")
public class SaiKuangController {

    @Resource
    private MytyAgendaServiceImpl agendaService;
    @Resource
    private MytyDengmiTempServiceImpl dengmiTempService;
    @Resource
    private MytyAnswerServiceImpl answerService;

    @RequestMapping(value = "/dangqiansaikuang", method = {RequestMethod.GET, RequestMethod.POST})
    public Map<String, Object> liezhong(HttpServletRequest request, Model model) {
        //获取当前比赛信息
        MytyAgenda agenda = agendaService.getNewAgenda();
        Map map = new HashMap();
        if(System.currentTimeMillis() > agenda.getStartTime().getTime() && System.currentTimeMillis() < agenda.getDoTime().getTime()){
            //当前时间处于开始时间和猜射时间之间，则统计输入谜题情况
            map = dengmiTempService.getInputSubjectCounts(agenda);
        } else if(System.currentTimeMillis() > agenda.getDoTime().getTime() && System.currentTimeMillis() < agenda.getJudgeTime().getTime()){
            //当前时间处于猜射时间和评分列中时间之间，则统计输入猜射情况
            map = answerService.getInputAnswerCounts(agenda);
        } else if(System.currentTimeMillis() > agenda.getJudgeTime().getTime() && System.currentTimeMillis() < agenda.getEndTime().getTime()){
            //当前时间处于评分列中时间和结束时间之间，则统计评分情况
            map = answerService.getJudgeCounts(agenda);
        }
        return map;
    }
}
