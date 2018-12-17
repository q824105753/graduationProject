package com.hc.service;

import java.util.List;

import com.hc.pojo.Notice;

import cn.itcast.common.page.Pagination;

public interface NoticeService {

	int deleteByPrimaryKey(Long noticeid);

    int insert(Notice record);

    Notice selectByPrimaryKey(Long noticeid);

    int updateByPrimaryKeySelective(Notice record);
    
    List<Notice> selectAllNotice();
    
    List<Notice> selectByNoticeDel();
    //分页查询
    Pagination selectAllNoticeByPage(Notice record,int pageNo);
    
    int selectNoticeCount(Notice record);
    
    Pagination selectAllNoticeFront(Notice record, int pageNo);
}
