package com.hallth.service;

import com.hallth.domain.MytyAgenda;

import java.util.List;

public interface MytyAgendaService {
    MytyAgenda getNewAgenda();

    int insert(MytyAgenda agenda);

    List<MytyAgenda> getAllAgenda();

}
