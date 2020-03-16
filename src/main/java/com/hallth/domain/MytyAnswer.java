package com.hallth.domain;

public class MytyAnswer {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column myty_answer.dm_id
     *
     * @mbggenerated
     */
    private Integer dmId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column myty_answer.user_id
     *
     * @mbggenerated
     */
    private String userId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column myty_answer.user_answer
     *
     * @mbggenerated
     */
    private String userAnswer;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column myty_answer.user_judge
     *
     * @mbggenerated
     */
    private Integer userJudge;
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column myty_answer.user_judge
     *
     * @mbggenerated
     */
    private Integer isRight;
    private Integer agendaRoundNo;

    private String userComment;

    public String getUserComment() {
        return userComment;
    }

    public void setUserComment(String userComment) {
        this.userComment = userComment;
    }

    public Integer getAgendaRoundNo() {
        return agendaRoundNo;
    }

    public void setAgendaRoundNo(Integer agendaRoundNo) {
        this.agendaRoundNo = agendaRoundNo;
    }

    public Integer getIsRight() {
        return isRight;
    }

    public void setIsRight(Integer isRight) {
        this.isRight = isRight;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column myty_answer.dm_id
     *
     * @return the value of myty_answer.dm_id
     *
     * @mbggenerated
     */
    public Integer getDmId() {
        return dmId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column myty_answer.dm_id
     *
     * @param dmId the value for myty_answer.dm_id
     *
     * @mbggenerated
     */
    public void setDmId(Integer dmId) {
        this.dmId = dmId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column myty_answer.user_id
     *
     * @return the value of myty_answer.user_id
     *
     * @mbggenerated
     */
    public String getUserId() {
        return userId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column myty_answer.user_id
     *
     * @param userId the value for myty_answer.user_id
     *
     * @mbggenerated
     */
    public void setUserId(String userId) {
        this.userId = userId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column myty_answer.user_answer
     *
     * @return the value of myty_answer.user_answer
     *
     * @mbggenerated
     */
    public String getUserAnswer() {
        return userAnswer;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column myty_answer.user_answer
     *
     * @param userAnswer the value for myty_answer.user_answer
     *
     * @mbggenerated
     */
    public void setUserAnswer(String userAnswer) {
        this.userAnswer = userAnswer;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column myty_answer.user_judge
     *
     * @return the value of myty_answer.user_judge
     *
     * @mbggenerated
     */
    public Integer getUserJudge() {
        return userJudge;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column myty_answer.user_judge
     *
     * @param userJudge the value for myty_answer.user_judge
     *
     * @mbggenerated
     */
    public void setUserJudge(Integer userJudge) {
        this.userJudge = userJudge;
    }
}