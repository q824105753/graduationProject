package com.hc.service;


import java.util.List;

import com.hc.pojo.Address;
import com.hc.pojo.City;
import com.hc.pojo.Province;

public interface AddressService {
	int deleteByPrimaryKey(Long addressid);

    int insert(Address record);

    Address selectByPrimaryKey(Long addressid);

    int updateByPrimaryKeySelective(Address record);
    
}
