package com.hc.dao;

import java.util.List;



import com.hc.pojo.Compact;

public interface CompactMapper {
    int deleteByPrimaryKey(Long compactid);

    int insert(Compact record);

    int insertSelective(Compact record);

    Compact selectByPrimaryKey(Long compactid);

    int updateByPrimaryKeySelective(Compact record);

    int updateByPrimaryKey(Compact record);
    
    Compact selectByTenderid(Long tenderid);
    
    List<Compact> selectAllCompact();

}