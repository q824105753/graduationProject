package com.qy.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qy.mapper.Category2Mapper;
import com.qy.pojo.Category2;
import com.qy.service.Category2Service;

@Service("category2Service")
@Transactional
public class Category2ServiceImpl implements Category2Service {
	
	@Autowired
	private Category2Mapper category2Mapper;

	public int deleteByPrimaryKey(Integer c2id) {
		int i = category2Mapper.deleteByPrimaryKey(c2id);
		return i;
	}

	public int insert(Category2 record) {
		int i = category2Mapper.insert(record);
		return i;
	}

	public Category2 selectByPrimaryKey(Integer c2id) {
		Category2 category2 = category2Mapper.selectByPrimaryKey(c2id);
		return category2;
	}

	public int updateByPrimaryKeySelective(Category2 record) {
		int i = category2Mapper.updateByPrimaryKeySelective(record);
		return i;
	}

	public List<Category2> selectCategory2() {
		List<Category2> c2list = category2Mapper.selectCategory2();
		return c2list;
	}

}
