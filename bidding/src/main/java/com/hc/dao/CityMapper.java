package com.hc.dao;

import com.hc.pojo.City;

public interface CityMapper {
    int deleteByPrimaryKey(Long cityid);

    int insert(City record);

    int insertSelective(City record);

    City selectByPrimaryKey(Long cityid);

    int updateByPrimaryKeySelective(City record);

    int updateByPrimaryKey(City record);
}