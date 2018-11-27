package com.hxx.drug.dao;

import com.hxx.drug.bean.Drug;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface DrugMapper {
    int deleteByPrimaryKey(Integer did);

    int insert(Drug record);

    int insertSelective(Drug record);

    Drug selectByPrimaryKey(Integer did);

    int updateByPrimaryKeySelective(Drug record);

    int updateByPrimaryKey(Drug record);

    List<Drug> selectAll(Drug drug);

    List<Drug> selectAllNoParame();

    Integer selectCount(Drug drug);
}