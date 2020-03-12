package com.hallth.controller;

import com.hallth.domain.MytyAgenda;
import com.hallth.domain.MytyAnswer;
import com.hallth.domain.MytyAnswerQueryBean;
import com.hallth.domain.MytyUser;
import com.hallth.service.impl.MytyAgendaServiceImpl;
import com.hallth.service.impl.MytyAnswerServiceImpl;
import org.apache.log4j.Logger;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/answer")
public class AnswerController {
    private static Logger logger = Logger.getLogger(AnswerController.class.getName());
    @Resource
    private MytyAnswerServiceImpl answerService;
    @Resource
    private MytyAgendaServiceImpl agendaService;

    @RequestMapping(value="/saveMyAnswer", method = {RequestMethod.GET, RequestMethod.POST})
    public Map<String, Object> saveMyAnswer(@RequestParam("dmTempId")String dmTempIds, @RequestParam("dmMidi")String dmMidis, HttpServletRequest request){
        MytyUser loginUser = (MytyUser)request.getSession().getAttribute("loginUserInfo");
        MytyAgenda agenda = agendaService.getNewAgenda();
        Map map = new HashMap();

        String[] idArray = dmTempIds.split("\t",-1);
        String[] midiArray = dmMidis.split("\t",-1);
        for(int i = 0; i < idArray.length-1; i ++){
            MytyAnswer answer = new MytyAnswer();
            String dmTempId = idArray[i];
            String dmMidi = midiArray[i];
            answer.setDmId(Integer.parseInt(dmTempId));
            answer.setUserAnswer(dmMidi);
            answer.setUserId(loginUser.getUserId());
            answer.setAgendaRoundNo(agenda.getRoundNo());
            //是否已回答
            MytyAnswer temp = answerService.getMyAnswer(answer);

            try{
                if(temp == null){
                    answerService.saveMyAnswer(answer, "I");
                } else {
                    answerService.saveMyAnswer(answer, "U");
                }
                map.put("result", true);
                map.put("msg", "操作成功！");
            } catch (Exception e){
                map.put("result", false);
                map.put("msg", "操作失败，请刷新页面重试");
            }
        }
        return  map;
    }

    @RequestMapping(value="/saveMyAnswerEasyUI", method = {RequestMethod.GET, RequestMethod.POST})
    public Map<String, Object> saveMyAnswerEasyUI(@RequestParam("list") List<MytyAnswerQueryBean> list, HttpServletRequest request){
        MytyUser loginUser = (MytyUser)request.getSession().getAttribute("loginUserInfo");
        Map map = new HashMap();
        for(MytyAnswerQueryBean item : list){
            MytyAgenda agenda = agendaService.getNewAgenda();
            MytyAnswer answer = new MytyAnswer();
            answer.setDmId(item.getDm_temp_id());
            answer.setUserAnswer(item.getDm_midi());
            answer.setUserId(loginUser.getUserId());
            answer.setAgendaRoundNo(agenda.getRoundNo());
            //是否已回答
            MytyAnswer temp = answerService.getMyAnswer(answer);

            try{
                if(temp == null){
                    answerService.saveMyAnswer(answer, "I");
                } else {
                    answerService.saveMyAnswer(answer, "U");
                }
                map.put("result", true);
                map.put("msg", "操作成功！");
            } catch (Exception e){
                map.put("result", false);
                map.put("msg", "操作失败，请刷新页面重试");
            }
        }
        return  map;
    }

    @RequestMapping(value="/saveMyJudge", method = {RequestMethod.GET, RequestMethod.POST})
    public Map<String, Object> saveMyJudge(@RequestParam("dmTempId")String dmTempIds, @RequestParam("userJudge")String judges, HttpServletRequest request){
        MytyUser loginUser = (MytyUser)request.getSession().getAttribute("loginUserInfo");
        MytyAgenda agenda = agendaService.getNewAgenda();
        Map map = new HashMap();
        String[] idArray = dmTempIds.split("\t",-1);
        String[] judgeArray = judges.split("\t",-1);
        MytyAnswer answer = new MytyAnswer();
        for(int i = 0; i < idArray.length-1; i++){
            String dmTempId = idArray[i];
            String judge = judgeArray[i];
            answer.setDmId(Integer.parseInt(dmTempId));
            answer.setUserJudge(Integer.parseInt(judge));
            answer.setUserId(loginUser.getUserId());
            answer.setAgendaRoundNo(agenda.getRoundNo());
            //是否已回答
            MytyAnswer temp = answerService.getMyAnswer(answer);
            try{
                if(temp == null){
                    answerService.saveMyAnswer(answer, "I");
                } else {
                    answerService.saveMyAnswer(answer, "UJ");
                }
                map.put("result", true);
                map.put("msg", "操作成功！");
            } catch (Exception e){
                map.put("result", false);
                map.put("msg", "操作失败，请刷新页面重试");
            }
        }
        return  map;
    }

    @RequestMapping(value = "/getScoreInfo", method = {RequestMethod.GET, RequestMethod.POST})
    public Map<String, Object> getScoreInfo(HttpServletRequest request, Model model) {
        MytyAgenda agenda = agendaService.getNewAgenda();
//        int currentPage = Integer.parseInt(request.getParameter("page"));
//        int pageSize = Integer.parseInt(request.getParameter("limit"));
        int currentPage = Integer.parseInt(request.getParameter("page"));
        int pageSize = Integer.parseInt(request.getParameter("rows"));
        int roundNo = agenda.getRoundNo();
        if(request.getParameter("roundNo") == null || request.getParameter("roundNo").equals("")){
            roundNo = agenda.getEndTime().getTime() > System.currentTimeMillis() ? (agenda.getRoundNo() - 1) : agenda.getRoundNo();
        } else {
            roundNo = Integer.parseInt(request.getParameter("roundNo"));
        }
        Map<String, Object> map = answerService.getScoreInfo(roundNo, currentPage, pageSize);
        return map;
    }

    @RequestMapping(value = "/getAnswerScoreInfo", method = {RequestMethod.GET, RequestMethod.POST})
    public Map<String, Object> getAnswerScoreInfo(HttpServletRequest request, Model model) {
        MytyAgenda agenda = agendaService.getNewAgenda();
//        int currentPage = Integer.parseInt(request.getParameter("page"));
//        int pageSize = Integer.parseInt(request.getParameter("limit"));
        int currentPage = Integer.parseInt(request.getParameter("page"));
        int pageSize = Integer.parseInt(request.getParameter("rows"));
        int roundNo = agenda.getRoundNo();
        if(request.getParameter("roundNo") == null || request.getParameter("roundNo").equals("")){
            roundNo = agenda.getEndTime().getTime() > System.currentTimeMillis() ? (agenda.getRoundNo() - 1) : agenda.getRoundNo();
        } else {
            roundNo = Integer.parseInt(request.getParameter("roundNo"));
        }
        Map<String, Object> map = answerService.getScoreInfo(roundNo, currentPage, pageSize);
        return map;
    }

    @RequestMapping(value = "/getSubjectScoreCount", method = {RequestMethod.GET, RequestMethod.POST})
    public Map<String, Object> getSubjectScoreCount(HttpServletRequest request, Model model) {
        MytyAgenda agenda = agendaService.getNewAgenda();
//        int currentPage = Integer.parseInt(request.getParameter("page"));
//        int pageSize = Integer.parseInt(request.getParameter("limit"));
        int currentPage = Integer.parseInt(request.getParameter("page"));
        int pageSize = Integer.parseInt(request.getParameter("rows"));
        int roundNo = agenda.getRoundNo();
        if(request.getParameter("roundNo") == null || request.getParameter("roundNo").equals("")){
            roundNo = agenda.getEndTime().getTime() > System.currentTimeMillis() ? (agenda.getRoundNo() - 1) : agenda.getRoundNo();
        } else {
            roundNo = Integer.parseInt(request.getParameter("roundNo"));
        }
        Map<String, Object> map = answerService.getScoreInfo(roundNo, currentPage, pageSize);
        return map;
    }

    @RequestMapping(value="/saveIsright", method = {RequestMethod.GET, RequestMethod.POST})
    public Map<String, Object> saveIsright(@RequestParam("dmTempId")String dmTempIds, @RequestParam("isRight")String isRights, @RequestParam("userId")String userIds, HttpServletRequest request){
        MytyAgenda agenda = agendaService.getNewAgenda();
        Map map = new HashMap();
        MytyAnswer answer = new MytyAnswer();
        String[] idArray = dmTempIds.split("\t",-1);
        String[] isRightArray = isRights.split("\t",-1);
        String[] userIdArray = userIds.split("\t",-1);
        for(int i = 0; i < idArray.length-1; i ++){
            answer.setDmId(Integer.parseInt(idArray[i]));
            answer.setIsRight(Integer.parseInt(isRightArray[i]));
            answer.setUserId(userIdArray[i]);
            answer.setAgendaRoundNo(agenda.getRoundNo());
            //是否已回答
            MytyAnswer temp = answerService.getMyAnswer(answer);
            try{
                if(temp == null){
                    answerService.saveMyAnswer(answer, "I");
                } else {
                    answerService.saveMyAnswer(answer, "UR");
                }
                map.put("result", true);
                map.put("msg", "操作成功！");
            } catch (Exception e){
                map.put("result", false);
                map.put("msg", "操作失败，请刷新页面重试");
            }
        }
        return  map;
    }

    @RequestMapping(value = "/getSubjectScoreInfo", method = {RequestMethod.GET, RequestMethod.POST})
    public Map<String, Object> getSubjectScoreInfo(HttpServletRequest request, Model model) {
        MytyAgenda agenda = agendaService.getNewAgenda();
        int currentPage = Integer.parseInt(request.getParameter("page"));
        int pageSize = Integer.parseInt(request.getParameter("limit"));
        int roundNo = agenda.getRoundNo();
        if(request.getParameter("roundNo") == null || request.getParameter("roundNo").equals("")){
            roundNo = agenda.getEndTime().getTime() > System.currentTimeMillis() ? (agenda.getRoundNo() - 1) : agenda.getRoundNo();
        } else {
            roundNo = Integer.parseInt(request.getParameter("roundNo"));
        }
        Map<String, Object> map = answerService.getSubjectScoreInfo(roundNo, currentPage, pageSize);
        return map;
    }

    @RequestMapping(value = "/getThisScoreInfo", method = {RequestMethod.GET, RequestMethod.POST})
    public Map<String, Object> getThisScoreInfo(HttpServletRequest request, Model model) {
        MytyAgenda agenda = agendaService.getNewAgenda();
        int currentPage = Integer.parseInt(request.getParameter("page"));
        int pageSize = Integer.parseInt(request.getParameter("limit"));
        int roundNo = agenda.getRoundNo();
        if(request.getParameter("roundNo") == null || request.getParameter("roundNo").equals("")){
            roundNo = agenda.getEndTime().getTime() > System.currentTimeMillis() ? (agenda.getRoundNo() - 1) : agenda.getRoundNo();
        } else {
            roundNo = Integer.parseInt(request.getParameter("roundNo"));
        }
        Map<String, Object> map = answerService.getThisScoreInfo(roundNo, currentPage, pageSize);
        return map;
    }

    @RequestMapping(value = "/getCountScoreInfo", method = {RequestMethod.GET, RequestMethod.POST})
    public Map<String, Object> getCountScoreInfo(HttpServletRequest request, Model model) {
        MytyAgenda agenda = agendaService.getNewAgenda();
        int currentPage = Integer.parseInt(request.getParameter("page"));
        int pageSize = Integer.parseInt(request.getParameter("rows"));
//        int currentPage = Integer.parseInt(request.getParameter("page"));
//        int pageSize = Integer.parseInt(request.getParameter("limit"));
        Map<String, Object> map = answerService.getCountScoreInfo(currentPage, pageSize);
        return map;
    }
}
