package com.hc.dao;

import java.util.List;

import com.hc.pojo.Check;

public interface CheckMapper {
    int deleteByPrimaryKey(Integer checkid);

    int insert(Check record);

    int insertSelective(Check record);

    Check selectByPrimaryKey(Integer checkid);

    int updateByPrimaryKeySelective(Check record);

    int updateByPrimaryKey(Check record);
    
    List<Check> selectAllCheck();
}