package com.qy.service;

import java.util.List;

import com.qy.pojo.User;

public interface UserService {

	int deleteByPrimaryKey(Integer uid);

    int insert(User record);
    
    User selectByPrimaryKey(Integer uid);

    int updateByPrimaryKeySelective(User record);

    List<User> selectAllUser();
    
    User selectByUser(User user);
    
    User selectByUname(String uname);
}
