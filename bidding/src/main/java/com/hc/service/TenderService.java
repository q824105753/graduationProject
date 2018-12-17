package com.hc.service;

import java.util.List;

import com.hc.pojo.Tender;

import cn.itcast.common.page.Pagination;

public interface TenderService {
	int deleteByPrimaryKey(Long tenderid);

    int insert(Tender record);

    Tender selectByPrimaryKey(Long tenderid);

    int updateByPrimaryKeySelective(Tender record);
    //查询
    Pagination selectAllTenderByPage(Tender record,int pageNo);
    
    List<Tender> selectAllTender();
    
    List<Tender> softDeleteTender();
    
    int selectTenderCount(Tender record);
    
    Pagination selectAllByState(Tender tender, int pageNo);

    Pagination selectAllTenderFront(Tender tender, int pageNo);

    List<Tender> selectAllTenderByState();
}
