package com.qy.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.qy.pojo.Message;
import com.qy.pojo.Order;
import com.qy.pojo.User;
import com.qy.service.MessageService;
import com.qy.service.UserService;

@Controller
public class MessageController {

	@Autowired
	private MessageService messageService;
	@Autowired
	private UserService userService;
	
	
	@RequestMapping("/selectAllMessage")
	public ModelAndView selectAllMessage(){
		List<Message> mlist = messageService.selectAll();
		for (Message message : mlist) {
			User user = userService.selectByPrimaryKey(message.getUid());
			message.setUser(user);
		}
		ModelAndView mav = new ModelAndView("site/comment","mlist",mlist);
		return mav;
	}
	
	@RequestMapping("/insertMessage")
	public String insertMessage(Message message,HttpServletRequest request,HttpServletResponse response){
		Cookie[] cs = request.getCookies();
	       boolean b = false;
	       String username = null;
	       Integer uid = null;
	       if(cs!=null){
	    	   for(Cookie c:cs){
		    	   if(c.getName().equals("user")){
		    		   b = true;
		    		   username = c.getValue();
		    		   break;
		    	   }
		       }
	       }
	       if(username!=null){
	    	   for(Cookie c:cs){
		    	   if(c.getName().equals("userId")){
		    		   b = true;
		    		   uid = Integer.parseInt(c.getValue());
		    		   break;
		    	   }
		       }
	       }
	      
	       
	       if(b){
		       message.setUid(uid);
		       messageService.insert(message);
		       return "redirect:selectAllMessage";
	       }else {
	    	   return "redirect:toLogin";
	       }
	       
	}
	
}
