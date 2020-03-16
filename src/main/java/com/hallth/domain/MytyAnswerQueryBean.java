package com.hallth.domain;

import lombok.Data;

@Data
public class MytyAnswerQueryBean {
    private int dm_temp_id;
    private String dm_mimian;
    private String dm_mimu;
    private String dm_midi;
    private String dm_mimianzhu;
    private String dm_midizhu;
    private String user_id;
    private String user_answer;
    private int user_judge;
    private int is_right;
    private String user_comment;
}
