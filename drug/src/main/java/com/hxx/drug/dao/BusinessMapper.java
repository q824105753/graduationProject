package com.hxx.drug.dao;

import com.hxx.drug.bean.Business;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BusinessMapper {
    int deleteByPrimaryKey(Integer bid);

    int insert(Business record);

    int insertSelective(Business record);

    Business selectByPrimaryKey(Integer bid);

    int updateByPrimaryKeySelective(Business record);

    int updateByPrimaryKey(Business record);

    List<Business> selectAll(Business business);

    List<Business> selectAllNoParame();

    Integer selectCount(Business business);

    List<Business> selectAllDel();
}