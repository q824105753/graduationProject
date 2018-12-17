package com.qy.mapper;

import java.util.List;

import com.qy.pojo.Order;

public interface OrderMapper {
    int deleteByPrimaryKey(Integer oid);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(Integer oid);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);

    List<Order> selectAllOrder();
    
    List<Order> selectByUid(Integer uid);
}