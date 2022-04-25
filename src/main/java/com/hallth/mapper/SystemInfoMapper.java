package com.hallth.mapper;

import com.hallth.domain.SystemInfo;
import com.hallth.domain.User;

import java.util.List;

public interface SystemInfoMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table system_info
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table system_info
     *
     * @mbggenerated
     */
    int insert(SystemInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table system_info
     *
     * @mbggenerated
     */
    int insertSelective(SystemInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table system_info
     *
     * @mbggenerated
     */
    SystemInfo selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table system_info
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(SystemInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table system_info
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(SystemInfo record);

    List<SystemInfo> getSystemList(SystemInfo systemInfo);

    int getCountSystemList(SystemInfo systemInfo);
}