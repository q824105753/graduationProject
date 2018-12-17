package com.hc.service;

import java.util.List;

import com.hc.pojo.Check;

public interface CheckService {

    Check selectByPrimaryKey(Integer checkid);
    
    List<Check> selectAllCheck();
}
