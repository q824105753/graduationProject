package com.qy.service;

import java.util.List;

import com.qy.pojo.Order;

public interface OrderService {

	int deleteByPrimaryKey(Integer oid);

    int insert(Order record);

    Order selectByPrimaryKey(Integer oid);

    int updateByPrimaryKeySelective(Order record);
    
    List<Order> selectAllOrder();
    
    List<Order> selectByUid(Integer uid);
}
