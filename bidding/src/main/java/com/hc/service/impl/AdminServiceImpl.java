package com.hc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hc.dao.AdminMapper;
import com.hc.pojo.Admin;
import com.hc.service.AdminService;
@Service("adminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper adminMapper;
	
	public Admin selectByAdmin(String aname, String apwd) {
		return adminMapper.selectByAdmin(aname, apwd);
	}

}
