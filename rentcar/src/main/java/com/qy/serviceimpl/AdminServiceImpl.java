package com.qy.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qy.mapper.AdminMapper;
import com.qy.pojo.Admin;
import com.qy.service.AdminService;
@Service("adminService")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMapper adminMapper;


	public Admin selectByAdmin(Admin admin) {
		return adminMapper.selectByAdmin(admin);
	}

}
