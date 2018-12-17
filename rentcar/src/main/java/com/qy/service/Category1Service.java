package com.qy.service;

import java.util.List;

import com.qy.pojo.Category1;

public interface Category1Service {

	int deleteByPrimaryKey(Integer c1id);

    int insert(Category1 record);

    Category1 selectByPrimaryKey(Integer c1id);

    int updateByPrimaryKeySelective(Category1 record);
    
    List<Category1> selectCategory1();
}
