package com.qy.mapper;

import java.util.List;

import com.qy.pojo.Category2;

public interface Category2Mapper {
    int deleteByPrimaryKey(Integer c2id);

    int insert(Category2 record);

    int insertSelective(Category2 record);

    Category2 selectByPrimaryKey(Integer c2id);

    int updateByPrimaryKeySelective(Category2 record);

    int updateByPrimaryKey(Category2 record);
    
    List<Category2> selectCategory2();
}