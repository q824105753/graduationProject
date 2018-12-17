package com.qy.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qy.mapper.UserMapper;
import com.qy.pojo.User;
import com.qy.service.UserService;
@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;

	public int deleteByPrimaryKey(Integer uid) {
		int i = userMapper.deleteByPrimaryKey(uid);
		return i;
	}

	public int insert(User record) {
		int i = userMapper.insert(record);
		return i;
	}

	public User selectByPrimaryKey(Integer uid) {
		User user = userMapper.selectByPrimaryKey(uid);
		return user;
	}

	public int updateByPrimaryKeySelective(User record) {
		int i = userMapper.updateByPrimaryKeySelective(record);
		return i;
	}

	public List<User> selectAllUser() {
		List<User> ulist = userMapper.selectAllUser();
		return ulist;
	}

	public User selectByUser(User user) {
		
		return userMapper.selectByUser(user);
	}

	public User selectByUname(String uname) {
		
		return userMapper.selectByUname(uname);
	}

}
