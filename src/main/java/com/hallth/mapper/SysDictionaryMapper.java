package com.hallth.mapper;

import com.hallth.domain.SysDictionary;

import java.util.List;

public interface SysDictionaryMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_dictionary
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_dictionary
     *
     * @mbggenerated
     */
    int insert(SysDictionary record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_dictionary
     *
     * @mbggenerated
     */
    int insertSelective(SysDictionary record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_dictionary
     *
     * @mbggenerated
     */
    SysDictionary selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_dictionary
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(SysDictionary record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_dictionary
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(SysDictionary record);

    List<SysDictionary> getDictList(SysDictionary sysDictionary);

    int getCountDictList(SysDictionary sysDictionary);
}