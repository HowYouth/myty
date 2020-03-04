package com.hallth.controller;

import com.hallth.service.impl.MytyAnswerServiceImpl;
import com.hallth.service.impl.MytyDengmiTempServiceImpl;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@RestController
@RequestMapping("/util")
public class UtilsController {

    @Resource
    private MytyDengmiTempServiceImpl dengmiTempService;
    @Resource
    private MytyAnswerServiceImpl answerService;

    @RequestMapping(value = "/userCompetitionDetail", method = {RequestMethod.GET, RequestMethod.POST})
    public Map<String, Object> userCompetitionDetail(HttpServletRequest request, Model model) {
        int currentPage = Integer.parseInt(request.getParameter("page"));
        int pageSize = Integer.parseInt(request.getParameter("limit"));
        int roundNo = Integer.parseInt(request.getParameter("roundNo"));
        String userId = request.getParameter("userId");
        Map<String, Object> map = dengmiTempService.userCompetitionDetail(roundNo, userId, currentPage, pageSize);
        return map;
    }

    @RequestMapping(value = "/userScoreDetailTable", method = {RequestMethod.GET, RequestMethod.POST})
    public Map<String, Object> userScoreDetailTable(HttpServletRequest request, Model model) {
        String userId = request.getParameter("userId");
        Map<String, Object> map = answerService.userScoreDetailTable(userId);
        return map;
    }

    @RequestMapping(value = "/userAnswerDetailTable", method = {RequestMethod.GET, RequestMethod.POST})
    public Map<String, Object> userAnswerDetailTable(HttpServletRequest request, Model model) {
        String userId = request.getParameter("userId");
        int roundNo = Integer.parseInt(request.getParameter("roundNo"));
        int pageSize = Integer.parseInt(request.getParameter("limit"));
        int currentPage = Integer.parseInt(request.getParameter("page"));
        Map<String, Object> map = answerService.userAnswerDetailTable(userId, roundNo, currentPage, pageSize);
        return map;
    }

    @RequestMapping(value = "/dengmiAnswerDetailTable", method = {RequestMethod.GET, RequestMethod.POST})
    public Map<String, Object> dengmiAnswerDetailTable(HttpServletRequest request, Model model) {
        int dmId = Integer.parseInt(request.getParameter("dmId"));
        int pageSize = Integer.parseInt(request.getParameter("limit"));
        int currentPage = Integer.parseInt(request.getParameter("page"));
        Map<String, Object> map = answerService.dengmiAnswerDetailTable(dmId, currentPage, pageSize);
        return map;
    }

    @RequestMapping(value = "/dengmiDetailTable", method = {RequestMethod.GET, RequestMethod.POST})
    public Map<String, Object> dengmiDetailTable(HttpServletRequest request, Model model) {
        int dmId = Integer.parseInt(request.getParameter("dmId"));
        Map<String, Object> map = dengmiTempService.dengmiDetailTable(dmId);
        return map;
    }
}
