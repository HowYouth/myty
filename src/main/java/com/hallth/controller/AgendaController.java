package com.hallth.controller;

import com.hallth.domain.JSONBean;
import com.hallth.domain.MytyAgenda;
import com.hallth.service.impl.MytyAgendaServiceImpl;
import com.hallth.utils.JsonUtils;
import org.apache.log4j.Logger;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/agenda")
public class AgendaController {

    private static Logger logger = Logger.getLogger(AgendaController.class.getName());

    @Resource
    private MytyAgendaServiceImpl agendaService;
    @Resource
    private JsonUtils jsonUtils;



    @RequestMapping(value="/newAgenda", method = {RequestMethod.GET, RequestMethod.POST})
    public Map newAgenda(@RequestParam("roundNo")int roundNo, @RequestParam("startTime") String startTime, @RequestParam("doTime")String doTime,
                         @RequestParam("judgeTime")String judgeTime, @RequestParam("endTime")String endTime, @RequestParam("inputCount")int inputCount, HttpServletRequest request, Model model){
        MytyAgenda agenda = new MytyAgenda();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Map map = new HashMap<>();
        try{
            agenda.setRoundNo(roundNo);
            agenda.setStartTime(sdf.parse(startTime));
            agenda.setDoTime(sdf.parse(doTime));
            agenda.setJudgeTime(sdf.parse(judgeTime));
            agenda.setEndTime(sdf.parse(endTime));
            agenda.setInputCount(inputCount);
            int i = agendaService.insert(agenda);
            if(i < 0){
                map.put("result", false );
                map.put("msg", "开启新比赛失败！");
            } else {
                map.put("result", true );
                map.put("msg", "开启成功！");
            }
        } catch (Exception e){
            logger.error("时间转换失败！" + e.getMessage());
            model.addAttribute("errMsg", e.getMessage());
            map.put("result", false );
            map.put("msg", "时间转换失败！");

        }
        return map;
    }

    @RequestMapping(value="/getAllAgenda", method = {RequestMethod.GET, RequestMethod.POST})
    public List<JSONBean> getAllAgenda(HttpServletRequest request, Model model){
//        Map map = new HashMap<>();
        List<MytyAgenda> list = agendaService.getAllAgenda();
//        if(list != null && list.size() > 0){
//            map.put("code", 0);
//            map.put("msg", "");
//            map.put("count", list.size());
//            map.put("data", list);
//        } else {
//            map.put("code", -1);
//            map.put("msg", "暂无数据");
//        }
        return jsonUtils.toJson(list);
    }
}
