package com.qy.mapper;

import java.util.List;

import com.qy.pojo.User;

import sun.rmi.rmic.iiop.StaticStringsHash;

public interface UserMapper {
    int deleteByPrimaryKey(Integer uid);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer uid);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    List<User> selectAllUser();
    
    User selectByUser(User user);
    
    User selectByUname(String uname);
}