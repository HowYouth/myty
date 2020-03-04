package com.hallth.controller;

import com.hallth.domain.MytyAgenda;
import com.hallth.domain.MytyDengmiTemp;
import com.hallth.domain.MytyUser;
import com.hallth.service.impl.MytyAgendaServiceImpl;
import com.hallth.service.impl.MytyDengmiTempServiceImpl;
import com.hallth.utils.SeqCreate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/page")
public class PageController {

    @Resource
    private MytyAgendaServiceImpl agendaService;
    @Resource
    private MytyDengmiTempServiceImpl dengmiTempService;

    @RequestMapping(value="/toInputMySubject", method = {RequestMethod.GET, RequestMethod.POST})
    public String toInputMySubject(HttpServletRequest request, Model model){
        MytyAgenda agenda = agendaService.getNewAgenda();
        MytyUser userInfo = (MytyUser)request.getSession().getAttribute("loginUserInfo");
        String loginUserId = userInfo.getUserId();
        Map<String, Object> map = dengmiTempService.selectByUserIdPageQuery(agenda.getRoundNo(), loginUserId, 1, Integer.MAX_VALUE);
        List<MytyDengmiTemp> list = (List<MytyDengmiTemp>)map.get("data");
        model.addAttribute("list", list);
        return "baseFunction/inputMySubject";
    }

    @RequestMapping(value = "/toChangePassword", method = {RequestMethod.GET, RequestMethod.POST})
    public String toChangePassword(HttpServletRequest request, Model model) {
        return "baseFunction/changePassword";
    }

    @RequestMapping(value = "/toReadMe", method = {RequestMethod.GET, RequestMethod.POST})
    public String toReadMe(HttpServletRequest request, Model model) {
        return "baseFunction/readMe";
    }

    @RequestMapping(value = "/toAddUser", method = {RequestMethod.GET, RequestMethod.POST})
    public String toAddUser(HttpServletRequest request, Model model) {
        return "managerFunction/addUser";
    }

    @RequestMapping(value = "/toAddMenu", method = {RequestMethod.GET, RequestMethod.POST})
    public String toAddMenu(HttpServletRequest request, Model model) {
        return "managerFunction/addMenu";
    }

    @RequestMapping(value = "/toParamManage", method = {RequestMethod.GET, RequestMethod.POST})
    public String toParamManage(HttpServletRequest request, Model model) {
        return "managerFunction/paramManage";
    }

    @RequestMapping(value = "/toAddParam", method = {RequestMethod.GET, RequestMethod.POST})
    public String toAddParam(HttpServletRequest request, Model model) {
        return "managerFunction/addParam";
    }

    @RequestMapping(value="/toNewAgenda", method = {RequestMethod.GET, RequestMethod.POST})
    public String toNewAgenda(HttpServletRequest request, Model model){
        MytyAgenda agenda = agendaService.getNewAgenda();
        int roundNo = 0;
        if(agenda == null){
            roundNo = 1;
        } else {
            roundNo = agenda.getRoundNo() + 1;
        }
        model.addAttribute("roundNo", roundNo);
        return "managerFunction/newAgenda";
    }

    @RequestMapping(value="/toMySubject", method = {RequestMethod.GET, RequestMethod.POST})
    public String toMySubject(HttpServletRequest request, Model model){
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("total", 0);
        map.put("list", null);
        map.put("currentPage",1);
        map.put("pageSize", 10);
        map.put("pageCount", 1);
        model.addAttribute("data", map);
        return "baseFunction/mySubject";
    }


    @RequestMapping(value="/toInputAnswer", method = {RequestMethod.GET, RequestMethod.POST})
    public String toInputAnswer(HttpServletRequest request, Model model){
        return "baseFunction/inputAnswer";
    }

    @RequestMapping(value="/toPingfen", method = {RequestMethod.GET, RequestMethod.POST})
    public String toPingfen(HttpServletRequest request, Model model){
        return "baseFunction/pingfen";
    }

    @RequestMapping(value="/toLiezhong", method = {RequestMethod.GET, RequestMethod.POST})
    public String toLiezhong(HttpServletRequest request, Model model){
        return "baseFunction/liezhong";
    }

    @RequestMapping(value="/toSaikuang", method = {RequestMethod.GET, RequestMethod.POST})
    public String toSaikuang(HttpServletRequest request, Model model){
        return "baseFunction/saikuang";
    }

    @RequestMapping(value="/toResult", method = {RequestMethod.GET, RequestMethod.POST})
    public String toResult(HttpServletRequest request, Model model){
        return "baseFunction/result";
    }

    @RequestMapping(value="/toThisScore", method = {RequestMethod.GET, RequestMethod.POST})
    public String toThisScore(HttpServletRequest request, Model model){
        return "baseFunction/thisScore";
    }

    @RequestMapping(value="/toHisScore", method = {RequestMethod.GET, RequestMethod.POST})
    public String toHisScore(HttpServletRequest request, Model model){
        return "baseFunction/hisScore";
    }

    @RequestMapping(value="/toAnswerScore", method = {RequestMethod.GET, RequestMethod.POST})
    public String toAnswerScore(HttpServletRequest request, Model model){
        return "baseFunction/answerScore";
    }

    @RequestMapping(value="/toSubjectScore", method = {RequestMethod.GET, RequestMethod.POST})
    public String toSubjectScore(HttpServletRequest request, Model model){
        return "baseFunction/subjectScore";
    }

    @RequestMapping(value="/toGoodSubject", method = {RequestMethod.GET, RequestMethod.POST})
    public String toGoodSubject(HttpServletRequest request, Model model){
        return "baseFunction/goodSubject";
    }

    @RequestMapping(value="/toAllSubject", method = {RequestMethod.GET, RequestMethod.POST})
    public String toAllSubject(HttpServletRequest request, Model model){
        return "baseFunction/allSubject";
    }

    @RequestMapping(value="/userManage", method = {RequestMethod.GET, RequestMethod.POST})
    public String userManage(HttpServletRequest request, Model model){
        return "managerFunction/userManage";
    }

    @RequestMapping(value="/menuManage", method = {RequestMethod.GET, RequestMethod.POST})
    public String menuManage(HttpServletRequest request, Model model){
        return "managerFunction/menuManage";
    }

    @RequestMapping(value="/toDevelopDetail", method = {RequestMethod.GET, RequestMethod.POST})
    public String toDevelopDetail(HttpServletRequest request, Model model){
        return "developDetail/developDetail";
    }
}
