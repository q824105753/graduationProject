package com.hc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hc.dao.UserMapper;
import com.hc.pojo.Company;
import com.hc.pojo.User;
import com.hc.service.UserService;

import cn.itcast.common.page.Pagination;
@Service("userService")
@Transactional
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserMapper userMapper;
	

	public int insert(User user) {
		return userMapper.insert(user);
	}

	public int deleteByPrimaryKey(Long userid) {
		return userMapper.deleteByPrimaryKey(userid);
	}

	public User selectByPrimaryKey(Long userid) {
		User user = userMapper.selectByPrimaryKey(userid);
		return user;
	}

	public int updateByPrimaryKeySelective(User user) {
		return userMapper.updateByPrimaryKeySelective(user);
	}

	public List<User> selectByDel() {
		return userMapper.selectByDel();
	}

	public int updateDel(Long userid) {
		int i = userMapper.updateDel(userid);
		return i;
	}

	public Pagination selectAllUserByPage(User record, int pageNo) {
		record.setCurrentPage((pageNo-1)*record.getSize());
		List<User> ulist = userMapper.selectAllUserByPage(record);
		Pagination page = new Pagination(pageNo,record.getSize(),userMapper.selectUserCount(record));
		StringBuilder params = new StringBuilder();
		params.append("size="+record.getSize());
		if(record.getUname()!=null) {
			params.append("&uname="+record.getUname());
		}
		String url = "bidding/admin/selectAllUserByPage";
		page.setList(ulist);
		page.pageView(url, params.toString());
		return page;
	}

	public List<User> selectAllUser() {
		
		return userMapper.selectAllUser();
	}

	public User selectByUser(String uname, String pwd) {
		return userMapper.selectByUser(uname, pwd);
	}

	public int selectUserCount(User record) {
		// TODO Auto-generated method stub
		return userMapper.selectUserCount(record);
	}

	public Integer selectUserCountByDel() {
		// TODO Auto-generated method stub
		return userMapper.selectUserCountByDel();
	}
}
