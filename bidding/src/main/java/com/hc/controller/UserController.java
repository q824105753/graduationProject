package com.hc.controller;

import java.lang.ProcessBuilder.Redirect;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Hex;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.RequestResponseBodyMethodProcessor;

import com.hc.dao.UserMapper;
import com.hc.pojo.Address;
import com.hc.pojo.Company;
import com.hc.pojo.Notice;
import com.hc.pojo.User;
import com.hc.service.NoticeService;
import com.hc.service.UserService;

import cn.itcast.common.page.Pagination;

@Controller

public class UserController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private UserMapper userMapper;
	
	@RequestMapping("/admin/selectAllUserByPage")
	public ModelAndView selectAllUserByPage(User user, Integer pageNo) {
		if(pageNo==null) {
			pageNo=1;
		}
		if(user.getSize()==null) {
			user.setSize(8);
		}
		Pagination page = userService.selectAllUserByPage(user, pageNo);
		ModelAndView mav = new ModelAndView("/admin/member-list", "ulist", page);
		mav.addObject("userCount",userService.selectUserCount(user));
		return mav;
	}
	
	@RequestMapping("/admin/insert")
	public String insert(User user) {
		
		
		
		int i = userService.insert(user);
		
		return "redirect:/admin/selectAllUserByPage";
	}
	
	@RequestMapping("/admin/ruanDelete")
	public String ruanDelete(Long userid) {
		User user = userService.selectByPrimaryKey(userid);
		user.setIsdelete(1);
		userService.updateByPrimaryKeySelective(user);
		return "redirect:/admin/selectAllUserByPage";
	}
	
	@RequestMapping("/admin/deleteByPrimaryKey")
	public String deleteByPrimaryKey(Long userid) {
		int i = userService.deleteByPrimaryKey(userid);
		return "redirect:/admin/selectAllUserByPage";
	}
	
	@RequestMapping("/admin/selectByDel")
	public ModelAndView selectByDel() {
		List<User> ulist = userService.selectByDel();
		ModelAndView mav = new ModelAndView("/admin/member-del","ulist",ulist);
		mav.addObject("countByDel",userService.selectUserCountByDel());
		return mav;
	}
	
	@RequestMapping("/admin/updateDel")
	public String updateDel(Long userid) {
		userService.updateDel(userid);
		return "redirect:/admin/selectByDel";
	}
	
	@RequestMapping("/admin/delByUserid")
	public String delByUserid(Long userid) {
		userService.deleteByPrimaryKey(userid);
		return "redirect:/admin/selectByDel";
	}
	
	@RequestMapping("/admin/loadByUserid")
	public ModelAndView loadByUserid(Long userid) {
		User user = userService.selectByPrimaryKey(userid);
		user.setCreatetime1(user.getCreatetime().substring(0, 10)+"T"+user.getCreatetime().substring(11, 16));;
		return new ModelAndView("/admin/member-edit","user",user);
	}
	
	@RequestMapping("/admin/updateUser")
	public String updateUser(User user) {
		userService.updateByPrimaryKeySelective(user);
		return "redirect:/admin/selectAllUserByPage";
	}
	
//-----------招标人-----------------------------------------------
	
	@RequestMapping("/bid/selectUser")
	public ModelAndView bidselectUser(HttpSession session) {
		User user1 = (User)session.getAttribute("user");
		User user = userService.selectByPrimaryKey(user1.getUserid());
		ModelAndView mav = new ModelAndView("/bid/member-list", "user", user);
		return mav;
	}
	
	@RequestMapping("/bid/insert")
	public String bidinsert(User user) {
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		user.setCreatetime(sdf.format(new Date()));
		
		int i = userService.insert(user);
		
		return "redirect:/bid/selectUser";
	}
	
	@RequestMapping("/bid/ruanDelete")
	public String bidruanDelete(Long userid) {
		User user = userService.selectByPrimaryKey(userid);
		user.setIsdelete(1);
		userService.updateByPrimaryKeySelective(user);
		return "redirect:/bid/selectUser";
	}
	
	@RequestMapping("/bid/deleteByPrimaryKey")
	public String biddeleteByPrimaryKey(Long userid) {
		int i = userService.deleteByPrimaryKey(userid);
		return "redirect:/bid/selectUser";
	}
	
	
	
	@RequestMapping("/bid/loadByUserid")
	public ModelAndView bidloadByUserid(Long userid) {
		User user = userService.selectByPrimaryKey(userid);
		user.setCreatetime1(user.getCreatetime().substring(0, 10)+"T"+user.getCreatetime().substring(11, 16));;
		return new ModelAndView("/bid/member-edit","user",user);
	}
	
	@RequestMapping("/bid/updateUser")
	public String bidupdateUser(User user) {
		userService.updateByPrimaryKeySelective(user);
		return "redirect:/bid/selectUser";
	}
	
	
	
//-----------前台-----------------------------------------------
	
	@RequestMapping("/login")    //登录
	public String login(User user1,HttpSession session) {
		User user = userService.selectByUser(user1.getUname(), encodePassword(user1.getPwd()));
		if(user!=null) {
//			List<Notice> nlist = noticeService.selectAllNotice();
//			System.out.println(nlist.size()+"+++++++++++++++++++");
//			return new ModelAndView("redirect:http://localhost:8080/bidding/index.jsp#overview","nlist",nlist);
		
			session.setAttribute("user", user);
			return "redirect:/selectAllByState";
		}
		else {
			return "toLogin";
		}
	}
	
	@RequestMapping("/register")    //注册
	public String register(User user) {
		user.setPwd(encodePassword(user.getPwd()));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		user.setCreatetime(sdf.format(new Date()));
		user.setFlag(1);
		user.setIsdelete(0);
		int i = userService.insert(user);
		if(i>0) {		//如果返回结果是大于1，证明注册成功，跳转到登录页
			return "toLogin";
		}else {			//如果返回结果小于0，证明注册失败，刷新注册页
			return "register";
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
