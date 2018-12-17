package com.hc.dao;

import com.hc.pojo.Address;

public interface AddressMapper {
    int deleteByPrimaryKey(Long addressid);

    int insert(Address record);

    int insertSelective(Address record);

    Address selectByPrimaryKey(Long addressid);

    int updateByPrimaryKeySelective(Address record);

    int updateByPrimaryKey(Address record);
}