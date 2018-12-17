package com.qy.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qy.pojo.Admin;
import com.qy.pojo.User;
import com.qy.service.AdminService;
import com.qy.service.UserService;

@Controller
public class LoginController {
	
	@Autowired
	private AdminService adminService;
	@Autowired
	private UserService userService;

	@RequestMapping("/adminLogin") //后台管理员登录
	public String adminLogin(Admin admin1,HttpSession session,HttpServletRequest request,HttpServletResponse response){
		Admin admin = adminService.selectByAdmin(admin1);
		if(admin!=null){
			session.setAttribute("admin", admin);
			return "admin/index";
		}else {
			return "admin/login";
		}
	}
	
	@RequestMapping("/userLogin") //前台用户登录
	public String userLogin(User user1,HttpServletRequest request,HttpServletResponse response){
		User user = userService.selectByUser(user1);
		if(user!=null){
			Cookie cookie = new Cookie("user",user.getUname());
			cookie.setMaxAge(60*60*24*365);
			response.addCookie(cookie);
			
			Cookie cookie1 = new Cookie("userId",String.valueOf(user.getUid()));
			cookie1.setMaxAge(60*60*24*365);
			response.addCookie(cookie1);
			return "redirect:index";
		}else {
			return "redirect:toLogin";
		}
	}
	
	
	@RequestMapping("/logout") //前台用户退出
	public String logout(HttpServletRequest request,HttpServletResponse response){
		Cookie cookie = new Cookie("user","");
		cookie.setMaxAge(0);
		response.addCookie(cookie);
		
		Cookie cookie1 = new Cookie("userId","");
		cookie1.setMaxAge(0);
		response.addCookie(cookie1);
			
		return "redirect:toLogin";
	}
	
	
}
