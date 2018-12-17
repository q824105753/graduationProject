package com.hc.dao;

import com.hc.pojo.Province;

public interface ProvinceMapper {
    int deleteByPrimaryKey(Long provinceid);

    int insert(Province record);

    int insertSelective(Province record);

    Province selectByPrimaryKey(Long provinceid);

    int updateByPrimaryKeySelective(Province record);

    int updateByPrimaryKey(Province record);
}