package com.hallth.service.impl;

import com.hallth.domain.MytySeq;
import com.hallth.mapper.MytySeqMapper;
import com.hallth.service.MytySeqService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class MytySeqServiceImpl implements MytySeqService {

    @Resource
    private MytySeqMapper seqMapper;

    @Override
    public int insert(MytySeq seq) {
        return seqMapper.insert(seq);
    }

    @Override
    public int getNextId(MytySeq seq) {
        return seqMapper.getNextId(seq);
    }

    public int updateNextId(MytySeq seq){
        return seqMapper.update(seq);
    }
}
