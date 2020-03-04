package com.hallth.utils;

import com.hallth.domain.MytySeq;
import com.hallth.service.impl.MytySeqServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class SeqCreate {

    @Resource
    private MytySeqServiceImpl seqService;

    public String getNextUserId(){
        MytySeq seq = new MytySeq();
        seq.setSeqName("user_id");
        int nextUserId = seqService.getNextId(seq);
        String userIdStr = initId(nextUserId, "MYTY_");
        seq.setNextId(nextUserId+1);
        seqService.updateNextId(seq);
        return userIdStr;
    }

    public int getNextDengmiTempId(){
        MytySeq seq = new MytySeq();
        seq.setSeqName("dengmi_temp_id");
        int nextUserId = seqService.getNextId(seq);
        seq.setNextId(nextUserId+1);
        seqService.updateNextId(seq);
        return nextUserId;
    }

    public String getNextMenuId() {
        MytySeq seq = new MytySeq();
        seq.setSeqName("menu_id");
        int nextMenuId = seqService.getNextId(seq);
        String menuIdStr = initId(nextMenuId, "menu_");
        seq.setNextId(nextMenuId+1);
        seqService.updateNextId(seq);
        return menuIdStr;
    }

    private String initId(int id, String idStr){
        if(id < 10){
            idStr = idStr + "00" + id;
        } else if(id < 100 && id >= 10){
            idStr = idStr + "0" + id;
        } else {
            idStr = idStr + id;
        }
        return idStr;
    }
}
