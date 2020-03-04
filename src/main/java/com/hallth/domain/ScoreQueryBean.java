package com.hallth.domain;

public class ScoreQueryBean {
    private int agenda_round_no;
    private String user_id;
    private String user_name;
    private String user_answer;
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

    public int getUser_judge() {
        return user_judge;
    }

    public void setUser_judge(int user_judge) {
        this.user_judge = user_judge;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getUser_answer() {
        return user_answer;
    }

    public void setUser_answer(String user_answer) {
        this.user_answer = user_answer;
    }

    public int getRownum() {
        return rownum;
    }

    public void setRownum(int rownum) {
        this.rownum = rownum;
    }

    public String getDm_mimian() {
        return dm_mimian;
    }

    public void setDm_mimian(String dm_mimian) {
        this.dm_mimian = dm_mimian;
    }

    public String getDm_mimu() {
        return dm_mimu;
    }

    public void setDm_mimu(String dm_mimu) {
        this.dm_mimu = dm_mimu;
    }

    public String getDm_midi() {
        return dm_midi;
    }

    public void setDm_midi(String dm_midi) {
        this.dm_midi = dm_midi;
    }

    public String getDm_mimianzhu() {
        return dm_mimianzhu;
    }

    public void setDm_mimianzhu(String dm_mimianzhu) {
        this.dm_mimianzhu = dm_mimianzhu;
    }

    public String getDm_midizhu() {
        return dm_midizhu;
    }

    public void setDm_midizhu(String dm_midizhu) {
        this.dm_midizhu = dm_midizhu;
    }


    public float getRight_proportion() {
        return right_proportion;
    }

    public void setRight_proportion(float right_proportion) {
        this.right_proportion = right_proportion;
    }

    public int getTimes() {
        return times;
    }

    public void setTimes(int times) {
        this.times = times;
    }

    public float getAvg_sum_score() {
        return avg_sum_score;
    }

    public void setAvg_sum_score(float avg_sum_score) {
        this.avg_sum_score = avg_sum_score;
    }

    public float getAvg_subject_score() {
        return avg_subject_score;
    }

    public void setAvg_subject_score(float avg_subject_score) {
        this.avg_subject_score = avg_subject_score;
    }

    public float getAvg_answer_score() {
        return avg_answer_score;
    }

    public void setAvg_answer_score(float avg_answer_score) {
        this.avg_answer_score = avg_answer_score;
    }

    public int getUser_ans_score() {
        return user_ans_score;
    }

    public void setUser_ans_score(int user_ans_score) {
        this.user_ans_score = user_ans_score;
    }

    private int startRow;
    private int pageSize;

    public int getSum_score() {
        return sum_score;
    }

    public void setSum_score(int sum_score) {
        this.sum_score = sum_score;
    }

    public String getDm_author_id() {
        return dm_author_id;
    }

    public void setDm_author_id(String dm_author_id) {
        this.dm_author_id = dm_author_id;
    }

    public String getDm_author_name() {
        return dm_author_name;
    }

    public void setDm_author_name(String dm_author_name) {
        this.dm_author_name = dm_author_name;
    }

    public int getStartRow() {
        return startRow;
    }

    public void setStartRow(int startRow) {
        this.startRow = startRow;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getAgenda_round_no() {
        return agenda_round_no;
    }

    public void setAgenda_round_no(int agenda_round_no) {
        this.agenda_round_no = agenda_round_no;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public int getUser_answer_score() {
        return user_answer_score;
    }

    public void setUser_answer_score(int user_answer_score) {
        this.user_answer_score = user_answer_score;
    }

    public int getUser_subject_score() {
        return user_subject_score;
    }

    public void setUser_subject_score(int user_subject_score) {
        this.user_subject_score = user_subject_score;
    }

    public int getDm_id() {
        return dm_id;
    }

    public void setDm_id(int dm_id) {
        this.dm_id = dm_id;
    }

    public int getRight_count() {
        return right_count;
    }

    public void setRight_count(int right_count) {
        this.right_count = right_count;
    }
}
