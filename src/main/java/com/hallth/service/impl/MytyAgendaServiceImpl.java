package com.hallth.service.impl;

import com.hallth.domain.MytyAgenda;
import com.hallth.mapper.MytyAgendaMapper;
import com.hallth.service.MytyAgendaService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class MytyAgendaServiceImpl implements MytyAgendaService {

    @Resource
    private MytyAgendaMapper agendaMapper;

    @Override
    public MytyAgenda getNewAgenda() {
        return agendaMapper.getNewRoundNo();
    }

    @Override
    public int insert(MytyAgenda agenda) {
        return agendaMapper.insert(agenda);
    }

    @Override
    public List<MytyAgenda> getAllAgenda() {
        return agendaMapper.getAllAgenda();
    }
}
