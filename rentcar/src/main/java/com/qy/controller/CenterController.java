package com.qy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CenterController {

	@RequestMapping("/index")
	public String index(){
		return "site/index";
	}
	
	@RequestMapping("/toLogin") //前台进入用户登录页面
	public String toLogin(){
		return "site/login";
	}
	
	@RequestMapping("/toRegister") //前台进入用户注册页面
	public String toRegister(){
		return "site/register";
	}
	
}
