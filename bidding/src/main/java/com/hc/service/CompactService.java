package com.hc.service;

import java.util.List;

import com.hc.pojo.Compact;

public interface CompactService {

    int insert(Compact record);

    Compact selectByPrimaryKey(Long compactid);

    int updateByPrimaryKeySelective(Compact record);
    
    Compact selectByTenderid(Long tenderid);

    List<Compact> selectAllCompact();
}
