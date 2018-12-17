package com.hc.dao;

import java.util.List;

import com.hc.pojo.Notice;

public interface NoticeMapper {
    int deleteByPrimaryKey(Long noticeid);

    int insert(Notice record);

    int insertSelective(Notice record);

    Notice selectByPrimaryKey(Long noticeid);

    int updateByPrimaryKeySelective(Notice record);

    int updateByPrimaryKey(Notice record);
    
    List<Notice> selectByNoticeDel();
    //分页查
    List<Notice> selectAllNoticeByPage(Notice record);
    
    int selectNoticeCount(Notice record);
    
    List<Notice> selectAllNotice();


}