package com.hallth.mapper;

import com.hallth.domain.SysDictionary;

import java.util.List;
import java.util.Map;

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

    List<SysDictionary> getDictDetails(SysDictionary sysDictionary);

    String getDictValue(SysDictionary sysDictionary);

    String getDictKey(SysDictionary sysDictionary);

    List<SysDictionary> getDictDetailList(SysDictionary sysDictionary);

    int updateIfNotNull(SysDictionary sysDictionary);

    int deleteDict(SysDictionary sysDictionary);

    int deleteKey(SysDictionary sysDictionary);
}