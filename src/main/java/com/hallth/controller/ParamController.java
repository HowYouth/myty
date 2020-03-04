package com.hallth.controller;

import com.hallth.domain.MytyParam;
import com.hallth.service.impl.MytyParamServiceImpl;
import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/param")
public class ParamController {
    private static Logger logger = Logger.getLogger(ParamController.class.getName());

    @Resource
    private MytyParamServiceImpl paramService;

    @RequestMapping(value="/getAllParam", method = {RequestMethod.GET, RequestMethod.POST})
    public Map<String, Object> saveMyAnswer(HttpServletRequest request){
        int currentPage = Integer.parseInt(request.getParameter("page"));
        int pageSize = Integer.parseInt(request.getParameter("limit"));
        Map map = paramService.getAllParam(currentPage, pageSize);
        return  map;
    }

    @RequestMapping(value="/addParam", method = {RequestMethod.GET, RequestMethod.POST})
    public Map<String, Object> addParam(@RequestParam("paramId") String paramId, @RequestParam("paramValue") String paramValue, @RequestParam("paramDesc") String paramDesc, HttpServletRequest request){
        MytyParam param = new MytyParam();
        param.setParamId(paramId);
        param.setParamDesc(paramDesc);
        param.setParamValue(paramValue);
        Map map = new HashMap();
        int res = paramService.insertParam(param);
        if(res > 0){
            map.put("result", true);
            map.put("msg", "参数新增成功");
        } else {
            map.put("result", false);
            map.put("msg", "参数新增失败");
        }
        return  map;
    }

    @RequestMapping(value="/deleteParam", method = {RequestMethod.GET, RequestMethod.POST})
    public Map<String, Object> deleteParam(@RequestParam("paramId")String paramId, HttpServletRequest request){
        MytyParam param = new MytyParam();
        param.setParamId(paramId);
        Map map = new HashMap();
        int res = paramService.deleteParam(param);
        if(res > 0){
            map.put("result", true);
            map.put("msg", "参数删除成功");
        } else {
            map.put("result", false);
            map.put("msg", "参数删除失败");
        }
        return  map;
    }

    @RequestMapping(value="/updateParam", method = {RequestMethod.GET, RequestMethod.POST})
    public Map<String, Object> updateParam(@RequestParam("paramId")String paramId, @RequestParam("colName")String colName, @RequestParam("colValue")String colValue, HttpServletRequest request){
        MytyParam param = new MytyParam();
        param.setParamId(paramId);
        if(colName.equals("paramValue")){
            param.setParamValue(colValue);
        } else if(colName.equals("paramDesc")){
            param.setParamDesc(colValue);
        }
        Map map = new HashMap();
        int res = paramService.updateParam(param);
        if(res > 0){
            map.put("result", true);
            map.put("msg", "参数修改成功");
        } else {
            map.put("result", false);
            map.put("msg", "参数修改失败");
        }
        return  map;
    }

}
