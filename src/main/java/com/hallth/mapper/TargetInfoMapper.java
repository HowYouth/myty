package com.hallth.mapper;

import com.hallth.domain.TargetInfo;
import com.hallth.domain.User;

import java.util.List;

public interface TargetInfoMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table target_info
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table target_info
     *
     * @mbggenerated
     */
    int insert(TargetInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table target_info
     *
     * @mbggenerated
     */
    int insertSelective(TargetInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table target_info
     *
     * @mbggenerated
     */
    TargetInfo selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table target_info
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(TargetInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table target_info
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(TargetInfo record);

    List<TargetInfo> getTargetList(TargetInfo targetInfo);

    int getCountTargetList(TargetInfo targetInfo);
}