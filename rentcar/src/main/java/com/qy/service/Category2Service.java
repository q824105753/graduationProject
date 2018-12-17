package com.qy.service;

import java.util.List;

import com.qy.pojo.Category2;

public interface Category2Service {

	int deleteByPrimaryKey(Integer c2id);

    int insert(Category2 record);

    Category2 selectByPrimaryKey(Integer c2id);

    int updateByPrimaryKeySelective(Category2 record);

    List<Category2> selectCategory2();
}
