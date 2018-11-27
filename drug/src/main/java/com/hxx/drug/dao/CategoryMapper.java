package com.hxx.drug.dao;

import com.hxx.drug.bean.Category;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CategoryMapper {
    int deleteByPrimaryKey(Integer cid);

    int insert(Category record);

    int insertSelective(Category record);

    Category selectByPrimaryKey(Integer cid);

    int updateByPrimaryKeySelective(Category record);

    int updateByPrimaryKey(Category record);

    List<Category> selectAll();

    List<Category> selectAllDel();
}