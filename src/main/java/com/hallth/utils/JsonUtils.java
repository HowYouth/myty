package com.hallth.utils;

import com.hallth.domain.JSONBean;
import com.hallth.domain.MytyAgenda;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class JsonUtils {
    public List<JSONBean> toJson(List<MytyAgenda> list){
        List<JSONBean> res = new ArrayList<>();
        for(MytyAgenda item : list){
            res.add(item.toJsonBean());
        }
        return res;
    }
}
