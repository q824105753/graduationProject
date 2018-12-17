package com.hc.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Hex;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hc.pojo.Admin;
import com.hc.pojo.User;
import com.hc.service.AdminService;
import com.hc.service.UserService;

@Controller
public class LoginController {

	@Autowired
	private AdminService adminService;
	@Autowired
	private UserService userService;
	
	@RequestMapping("adminLogin")
	public String adminLogin(String aname,String apwd,HttpSession session) {
		Admin admin = adminService.selectByAdmin(aname, encodePassword(apwd));
		if(admin!=null) {
			session.removeAttribute("user");
			session.setAttribute("admin", admin);
			return "redirect:admin/index";
		}else {
			return "/login/adminlogin";
		}
	}
	
	@RequestMapping("bidLogin")
	public String bidLogin(String uname,String pwd,HttpSession session) {
		User user = userService.selectByUser(uname, encodePassword(pwd));
		if(user!=null) {
			session.removeAttribute("admin");
			session.setAttribute("user", user);
			
			return "redirect:bid/index";
		}else {
			return "/login/bidlogin";
		}
	}
	
	@RequestMapping("/bidRegister")    //注册
	public String bidRegister(User user) {
		user.setPwd(encodePassword(user.getPwd()));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		user.setCreatetime(sdf.format(new Date()));
		user.setFlag(1);
		user.setIsdelete(0);
		int i = userService.insert(user);
		if(i>0) {		//如果返回结果是大于1，证明注册成功，跳转到登录页
			return "login/bidlogin";
		}else {			//如果返回结果小于0，证明注册失败，刷新注册页
			return "login/bidRegister";
		}
	}
	
	public String encodePassword(String password){
		//
		//password = "gxzcwefxcbergfd123456errttyyytytrnfzeczxcvertwqqcxvxb";
		//1:MD5  算法
		String algorithm = "MD5";
		char[] encodeHex = null;
		try {
			//MD5加密
			MessageDigest instance = MessageDigest.getInstance(algorithm);
			//加密后  
			byte[] digest = instance.digest(password.getBytes());
			
			//
			//2:十六进制
			encodeHex = Hex.encodeHex(digest);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return new String(encodeHex);
	}
}
