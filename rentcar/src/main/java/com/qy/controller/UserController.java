package com.qy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qy.pojo.Category1;
import com.qy.pojo.User;
import com.qy.service.UserService;
@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@RequestMapping("/userList")
	@ResponseBody
	public Map userList(){
		Map<String, List<User>> map = new HashMap<String, List<User>>();
		map.put("ulist",userService.selectAllUser());
		return map;
	}
	
	@RequestMapping("/deluser")
	@ResponseBody
	public Map deluser(int uid){
		Map map = new HashMap();
		map.put("row", userService.deleteByPrimaryKey(uid));
		return map;
	}
	
	@RequestMapping("/loaduser")
	@ResponseBody
	public Map loaduser(int uid){
		Map map = new HashMap();
		map.put("user", userService.selectByPrimaryKey(uid));
		return map;
	}
	
	@RequestMapping("/insertuser")
	@ResponseBody
	public Map insertuser(User user){
		System.out.println(user);
		Map map = new HashMap();
		map.put("row", userService.insert(user));
		return map;
	}
	
	@RequestMapping("/updateuser")
	@ResponseBody
	public Map updateuser(User user){
		Map map = new HashMap();
		map.put("row", userService.updateByPrimaryKeySelective(user));
		return map;
	}
	
	@RequestMapping("/userRegister")
	public String userRegister(User user){
		User user1 = userService.selectByUname(user.getUname());
		if(user1==null){
			int row = userService.insert(user);
			if(row>0){
				return "site/login";
			}else {
				return "site/register";
			}
		}else{
			return "site/register";
		}
		
	}
	
}
