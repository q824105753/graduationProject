package com.qy.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qy.mapper.Category1Mapper;
import com.qy.pojo.Category1;
import com.qy.service.Category1Service;
@Service("category1Service")
@Transactional
public class Category1ServiceImpl implements Category1Service {

	@Autowired
	private Category1Mapper category1Mapper;
	
	public int deleteByPrimaryKey(Integer c1id) {
		int i = category1Mapper.deleteByPrimaryKey(c1id);
		return i;
	}

	public int insert(Category1 record) {
		int i = category1Mapper.insert(record);
		return i;
	}


	public Category1 selectByPrimaryKey(Integer c1id) {
		Category1 category1 = category1Mapper.selectByPrimaryKey(c1id);
		return category1;
	}

	public int updateByPrimaryKeySelective(Category1 record) {
		int i = category1Mapper.updateByPrimaryKeySelective(record);
		return i;
	}

	public List<Category1> selectCategory1() {
		List<Category1> c1list = category1Mapper.selectCategory1();
		return c1list;
	}

}
