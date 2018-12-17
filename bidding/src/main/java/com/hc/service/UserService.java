package com.hc.service;

import java.util.List;


import com.hc.pojo.User;

import cn.itcast.common.page.Pagination;

public interface UserService {
	//查询
	public Pagination selectAllUserByPage(User user,int pageNo);
	
	int selectUserCount(User record);
	//添加用户
	public int insert(User user);
	//刪除用户
	public int deleteByPrimaryKey(Long userid);
	
	User selectByPrimaryKey(Long userid);
	
	int updateByPrimaryKeySelective(User user);
	//查询删除的用户
    List<User> selectByDel();
    //恢复删除的用户
    int updateDel(Long userid);
    
    List<User> selectAllUser();
    
    User selectByUser(String uname,String pwd);

    Integer selectUserCountByDel();
}
