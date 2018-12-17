package com.hc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hc.dao.CompactMapper;
import com.hc.pojo.Compact;
import com.hc.service.CompactService;
@Service("compactService")
public class CompactServiceImpl implements CompactService {

	@Autowired
	private CompactMapper compactMapper;
	
	public int insert(Compact record) {
		// TODO Auto-generated method stub
		return compactMapper.insert(record);
	}

	public Compact selectByPrimaryKey(Long compactid) {
		// TODO Auto-generated method stub
		return compactMapper.selectByPrimaryKey(compactid);
	}

	public int updateByPrimaryKeySelective(Compact record) {
		// TODO Auto-generated method stub
		return compactMapper.updateByPrimaryKeySelective(record);
	}

	public Compact selectByTenderid(Long tenderid) {
		// TODO Auto-generated method stub
		return compactMapper.selectByTenderid(tenderid);
	}

	public List<Compact> selectAllCompact() {
		// TODO Auto-generated method stub
		return compactMapper.selectAllCompact();
	}

}
