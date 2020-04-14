package com.hallth.controller;

import com.hallth.domain.JDBCBean;
import com.hallth.domain.JSONBean;
import com.hallth.utils.JDBCUtils;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/doSQL")
public class JDBCController {
    @Resource
    private JDBCUtils jdbcUtils;

    @RequestMapping(value="/executeSQL", method = {RequestMethod.GET, RequestMethod.POST})
    public JDBCBean newAgenda(@RequestParam("sql")String sql, @RequestParam("type")String type, HttpServletRequest request, Model model){
        Map map = new HashMap<>();
        JDBCBean bean = jdbcUtils.doSQL(sql,Integer.parseInt(type));
        model.addAttribute("resp", bean);
        return bean;
    }

    @RequestMapping(value="/getType", method = {RequestMethod.GET, RequestMethod.POST})
    public  List<JSONBean> getType( HttpServletRequest request, Model model){
        List<JSONBean> list = new ArrayList<>();
        String[] ids = {"1","2","3","4"};
        String[] texts = {"查询","新增","删除","修改"};
        for(int i = 0; i < ids.length; i ++){
            JSONBean bean = new JSONBean();
            bean.setId(ids[i]);
            bean.setText(texts[i]);
            list.add(bean);
        }
        return list;
    }
}
