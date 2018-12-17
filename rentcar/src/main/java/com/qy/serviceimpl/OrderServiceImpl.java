package com.qy.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qy.mapper.OrderMapper;
import com.qy.pojo.Order;
import com.qy.service.OrderService;
@Service("orderService")
@Transactional
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderMapper orderMapper;

	public int deleteByPrimaryKey(Integer oid) {
		int i = orderMapper.deleteByPrimaryKey(oid);
		return i;
	}

	public int insert(Order record) {
		int i = orderMapper.insert(record);
		return i;
	}


	public Order selectByPrimaryKey(Integer oid) {
		Order order = orderMapper.selectByPrimaryKey(oid);
		return order;
	}

	public int updateByPrimaryKeySelective(Order record) {
		int i = orderMapper.updateByPrimaryKeySelective(record);
		return i;
	}

	public List<Order> selectAllOrder() {
		List<Order> olist = orderMapper.selectAllOrder();
		return olist;
	}

	public List<Order> selectByUid(Integer uid) {
		return orderMapper.selectByUid(uid);
	}

}
