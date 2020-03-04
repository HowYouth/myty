package com.hallth.domain;

import java.util.Objects;

public class UserAnswerScore {
    private String user_name;
    private String user_id;
    private int ans_ascore;
    private int subject_score;
    private int agenda_round_no;

    public int getSubject_score() {
        return subject_score;
    }

    public void setSubject_score(int subject_score) {
        this.subject_score = subject_score;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public int getAns_ascore() {
        return ans_ascore;
    }

    public void setAns_ascore(int ans_ascore) {
        this.ans_ascore = ans_ascore;
    }

    public int getAgenda_round_no() {
        return agenda_round_no;
    }

    public void setAgenda_round_no(int agenda_round_no) {
        this.agenda_round_no = agenda_round_no;
    }

    public boolean equalsWith(UserAnswerScore o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        return Objects.equals(user_id, o.user_id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(user_id);
    }
}
