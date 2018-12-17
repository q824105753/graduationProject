package com.hc.dao;

import java.util.List;

import com.hc.pojo.Tender;

public interface TenderMapper {
    int deleteByPrimaryKey(Long tenderid);

    int insert(Tender record);

    int insertSelective(Tender record);

    Tender selectByPrimaryKey(Long tenderid);

    int updateByPrimaryKeySelective(Tender record);

    int updateByPrimaryKey(Tender record);
    //查询
    List<Tender> selectAllTenderByPage(Tender record);
    
    List<Tender> selectAllTender();
    //软删除
    List<Tender> softDeleteTender();
    
    int selectTenderCount(Tender record);
    
    List<Tender> selectAllByState(Tender tender);
    
    int selectAllCountByState(Tender tender);
    
    List<Tender> selectAllTenderFront(Tender tender);
    
    int selectAllTenderFrontCount(Tender tender);
    
    List<Tender> selectAllTenderByState();
}