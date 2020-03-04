package com.hallth.domain;

public class DengmiQueryBean {
    private int dm_temp_id;
    private String dm_mimian;
    private String dm_mimu;
    private String dm_midi;
    private String dm_mimianzhu;
    private String dm_midizhu;
    private String user_name;
    private int user_judge;
    private int agenda_round_no;

    private int startRow;
    private int pageSize;

    public int getAgenda_round_no() {
        return agenda_round_no;
    }

    public void setAgenda_round_no(int agenda_round_no) {
        this.agenda_round_no = agenda_round_no;
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

    public int getDm_temp_id() {
        return dm_temp_id;
    }

    public void setDm_temp_id(int dm_temp_id) {
        this.dm_temp_id = dm_temp_id;
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

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public int getUser_judge() {
        return user_judge;
    }

    public void setUser_judge(int user_judge) {
        this.user_judge = user_judge;
    }
}
