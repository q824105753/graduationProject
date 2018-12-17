package com.hc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hc.dao.CheckMapper;
import com.hc.pojo.Check;
import com.hc.service.CheckService;
@Service("checkService")
@Transactional
public class CheckServiceImpl implements CheckService {

	@Autowired
	private CheckMapper checkMapper;
	

	public Check selectByPrimaryKey(Integer checkid) {
		return checkMapper.selectByPrimaryKey(checkid);
	}


	public List<Check> selectAllCheck() {
		return checkMapper.selectAllCheck();
	}


}
