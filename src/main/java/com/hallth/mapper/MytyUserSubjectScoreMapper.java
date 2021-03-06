package com.hallth.mapper;

import com.hallth.domain.MytyUserSubjectScore;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

public interface MytyUserSubjectScoreMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table myty_user_subject_score
     *
     * @mbggenerated
     */
    int insert(MytyUserSubjectScore record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table myty_user_subject_score
     *
     * @mbggenerated
     */
    int insertSelective(MytyUserSubjectScore record);

    int isCounted(MytyUserSubjectScore subjectScore);

    int updateUserSubjectScoreByRoundNo(@RequestParam("agendaRoundNo") Integer roundNo);

    List<MytyUserSubjectScore> selectByRoundNo(@RequestParam("agendaRoundNo") Integer roundNo);

    int updateRank(MytyUserSubjectScore tt);
}