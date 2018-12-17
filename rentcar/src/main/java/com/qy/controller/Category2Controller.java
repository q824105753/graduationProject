package com.qy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qy.pojo.Category2;
import com.qy.service.Category2Service;

@Controller
public class Category2Controller {

	@Autowired
	private Category2Service category2Service;
	
	@RequestMapping("/c2List")
	@ResponseBody
	public Map c2List(){
		Map<String, List<Category2>> map = new HashMap<String, List<Category2>>();
		map.put("c2list",category2Service.selectCategory2());
		return map;
	}
	
	@RequestMapping("/delc2")
	@ResponseBody
	public Map delc2(int c2id){
		Map map = new HashMap();
		map.put("row", category2Service.deleteByPrimaryKey(c2id));
		return map;
	}
	
	@RequestMapping("/loadc2")
	@ResponseBody
	public Map loadc2(int c2id){
		Map map = new HashMap();
		map.put("category2", category2Service.selectByPrimaryKey(c2id));
		return map;
	}
	
	@RequestMapping("/insertc2")
	@ResponseBody
	public Map insertc2(Category2 category2){
		Map map = new HashMap();
		map.put("row", category2Service.insert(category2));
		return map;
	}
	
	@RequestMapping("/updatec2")
	@ResponseBody
	public Map updatec2(Category2 category2){
		Map map = new HashMap();
		map.put("row", category2Service.updateByPrimaryKeySelective(category2));
		return map;
	}
}
