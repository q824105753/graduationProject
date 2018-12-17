package com.hc.dao;

import com.hc.pojo.Area;

public interface AreaMapper {
    int deleteByPrimaryKey(Long areaid);

    int insert(Area record);

    int insertSelective(Area record);

    Area selectByPrimaryKey(Long areaid);

    int updateByPrimaryKeySelective(Area record);

    int updateByPrimaryKey(Area record);
}