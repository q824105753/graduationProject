package com.hxx.drug.dao;

import com.hxx.drug.bean.Stock;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface StockMapper {
    int deleteByPrimaryKey(Integer sid);

    int insert(Stock record);

    int insertSelective(Stock record);

    Stock selectByPrimaryKey(Integer sid);

    int updateByPrimaryKeySelective(Stock record);

    int updateByPrimaryKey(Stock record);

    List<Stock> selectAll(Stock stock);

    Integer selectCount(Stock stock);
}