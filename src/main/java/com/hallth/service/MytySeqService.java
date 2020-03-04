package com.hallth.service;

import com.hallth.domain.MytySeq;

public interface MytySeqService {
    int insert(MytySeq seq);

    int getNextId(MytySeq seq);

    int updateNextId(MytySeq seq);
}
