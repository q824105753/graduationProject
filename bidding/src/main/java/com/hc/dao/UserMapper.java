package com.hc.dao;

import java.util.List;

import com.hc.pojo.User;

public interface UserMapper {
    int deleteByPrimaryKey(Long userid);

    int insert(User user);

    User selectByPrimaryKey(Long userid);

    int updateByPrimaryKeySelective(User user);

    int updateByPrimaryKey(User record);
    
    List<User> selectAllUserByPage(User record);
    
    List<User> selectAllUser();
    
    List<User> selectByDel();
    int updateDel(Long userid);
    
    int selectUserCount(User record);
    
    User selectByUser(String uname,String pwd);
    
    Integer selectUserCountByDel();
 }