package com.hallth.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ScoreQueryBean {
    private int agenda_round_no;
    private String user_id;
    private String user_name;
    private String user_answer;
    private String user_comment;
    private String dm_author_id;
    private String dm_author_name;
    private int user_judge;
    private int sum_score;
    private int user_answer_score;
    private int user_subject_score;
    private int dm_id;
    private int right_count;
    private int times;
    private float avg_sum_score;
    private float avg_subject_score;
    private float avg_answer_score;
    private int user_ans_score;
    private String dm_mimian;
    private String dm_mimu;
    private String dm_midi;
    private String dm_mimianzhu;
    private String dm_midizhu;
    private int rownum;
    private float right_proportion;
    private String result;
    private int startRow;
    private int pageSize;
}
