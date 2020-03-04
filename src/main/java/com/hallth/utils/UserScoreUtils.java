package com.hallth.utils;

import com.hallth.domain.MytyScore;
import com.hallth.mapper.MytyScoreMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserScoreUtils {

    @Resource
    private MytyScoreMapper scoreMapper;

    public List<MytyScore>  getUserScoreList(MytyScore scoreQueryBean){
        List<MytyScore> userAnswerScoreList = scoreMapper.getScoreByRoundNo(scoreQueryBean);
        return userAnswerScoreList;
    }

    public int getUserScoreListCount(MytyScore scoreQueryBean) {
        return scoreMapper.getScoreByRoundNoCount(scoreQueryBean);
    }
}
