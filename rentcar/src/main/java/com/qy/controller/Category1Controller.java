package com.qy.controller;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.qy.pojo.Category1;
import com.qy.service.Category1Service;

@Controller
public class Category1Controller {

	@Autowired
	private Category1Service category1Service;
	
	@RequestMapping("/c1List")
	@ResponseBody
	public Map c1List(){
		Map<String, List<Category1>> map = new HashMap<String, List<Category1>>();
		map.put("c1list",category1Service.selectCategory1());
		return map;
	}
	
	@RequestMapping("/delc1")
	@ResponseBody
	public Map delc1(int c1id){
		Map map = new HashMap();
		map.put("row", category1Service.deleteByPrimaryKey(c1id));
		return map;
	}
	
	@RequestMapping("/loadc1")
	@ResponseBody
	public Map loadc1(int c1id){
		Map map = new HashMap();
		map.put("category1", category1Service.selectByPrimaryKey(c1id));
		System.out.println(category1Service.selectByPrimaryKey(c1id).getC1id());
		return map;
	}
	
	@RequestMapping("/insertc1")
	@ResponseBody
	public Map insertc1(Category1 category1){
		Map map = new HashMap();
		map.put("row", category1Service.insert(category1));
		return map;
	}
	
	@RequestMapping("/updatec1")
	@ResponseBody
	public Map updatec1(Category1 category1){
		Map map = new HashMap();
		map.put("row", category1Service.updateByPrimaryKeySelective(category1));
		return map;
	}
}
