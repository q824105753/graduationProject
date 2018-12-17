package com.qy.controller;

import java.io.File;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import com.qy.pojo.Car;
import com.qy.pojo.Category1;
import com.qy.pojo.Category2;
import com.qy.pojo.Order;
import com.qy.service.CarService;
import com.qy.service.Category1Service;
import com.qy.service.Category2Service;
import com.qy.util.Paging;

@Controller
public class CarController {

	@Autowired
	private CarService carService;
	@Autowired
	private Category1Service category1Service;
	@Autowired
	private Category2Service category2Service;

	// 后台代码
	// 查询所有没有被删除的车辆
	@RequestMapping("/carList")
	@ResponseBody
	public Map carList(int pagecount) {
		Map map = new HashMap();
		List<Car> clist = carService.selectAllCar();
		for (Car car : clist) {
			// 根据id查询出一级分类二级分类的对象，再放在car的对象中,为前台显示使用
			car.setC1(category1Service.selectByPrimaryKey(car.getC1id()));
			car.setC2(category2Service.selectByPrimaryKey(car.getC2id()));
		}
		Paging<Car> pagging = new Paging(8, pagecount, clist);
		map.put("clist", pagging);
		return map;
	}

	// 查询所有被删除的车辆
	@RequestMapping("/carDelList")
	@ResponseBody
	public Map carDelList(int pagecount) {

		Map map = new HashMap();
		List<Car> clist = carService.selectDelCar();
		for (Car car : clist) {
			// 根据id查询出一级分类二级分类的对象，再放在car的对象中,为前台显示使用
			car.setC1(category1Service.selectByPrimaryKey(car.getC1id()));
			car.setC2(category2Service.selectByPrimaryKey(car.getC2id()));
		}
		Paging<Car> pagging = new Paging(8, pagecount, clist);
		map.put("clist", pagging);
		return map;
	}

	@RequestMapping("/delcar") // 真删除
	@ResponseBody
	public Map delcar(int cid) {
		Map map = new HashMap();
		map.put("row", carService.deleteByPrimaryKey(cid));
		return map;
	}

	@RequestMapping("/softDelcar") // 软删除
	@ResponseBody
	public Map softDelcar(int cid) {
		Map map = new HashMap();
		Car car = carService.selectByPrimaryKey(cid);
		car.setIsdel(1);
		map.put("row", carService.updateByPrimaryKeySelective(car));
		return map;
	}

	@RequestMapping("/resetDelcar") // 恢复
	@ResponseBody
	public Map resetDelcar(int cid) {
		Map map = new HashMap();
		Car car = carService.selectByPrimaryKey(cid);
		car.setIsdel(0);
		map.put("row", carService.updateByPrimaryKeySelective(car));
		return map;
	}

	@RequestMapping("/loadcar")
	@ResponseBody
	public Map loadcar(int cid) {
		Map map = new HashMap();
		map.put("car", carService.selectByPrimaryKey(cid));
		return map;
	}

	@RequestMapping("/insertcar")
	@ResponseBody
	public Map insertcar(Car car,MultipartFile file,HttpServletRequest request) throws Exception {
		Map map = new HashMap();
		String fileName = file.getOriginalFilename();
		String filePath = request.getSession().getServletContext().getRealPath("uploadimg");
		file.transferTo(new File(filePath+File.separator+fileName));
		car.setCarimg("http://localhost:8080/uploadimg/"+fileName);
		
		map.put("row", carService.insert(car));
		return map;
	}

	@RequestMapping("/updatecar")
	@ResponseBody
	public Map updatecar(Car car,MultipartFile file,HttpServletRequest request) throws Exception {
		Map map = new HashMap();
		
		String fileName = file.getOriginalFilename();
		String filePath = request.getSession().getServletContext().getRealPath("uploadimg");
	    System.out.println("9999999999999"+filePath);
		file.transferTo(new File(filePath+File.separator+fileName));
		car.setCarimg("http://localhost:8080/uploadimg/"+fileName);
		
		map.put("row", carService.updateByPrimaryKeySelective(car));
		return map;
	}

//--------------------------------------------------------------------	
	
	// 前台代码
	@RequestMapping("/frontCarList")		//访问前台查询车辆页面
	public ModelAndView frontCarList(Car car, Integer pageNo) {
		if (car.getCname() != null && car.getCname() == "") {
			car.setCname(null);
		}
		if (car.getC1id() != null && car.getC1id() == 0) {
			car.setC1id(null);
		}
		if (car.getC2id() != null && car.getC2id() == 0) {
			car.setC2id(null);
		}
		if (car.getSize() == null) {
			car.setSize(8);
		}
		if (pageNo == null) {
			pageNo = 1;
		}
		ModelAndView mav = new ModelAndView("site/select", "page", carService.frontCarList(car, pageNo));
		mav.addObject("c1", category1Service.selectCategory1());
		mav.addObject("c2", category2Service.selectCategory2());
		mav.addObject("car", car);
		return mav;
	}
	
	@RequestMapping("/frontRecommend")		//推荐车源
	public ModelAndView frontIndex(){
		List<Car> clist = new ArrayList<Car>();
		Set<Integer> set=new HashSet<Integer>();
		for(;set.size()<8;){
			set.add(new Random().nextInt(28)+1);
		}
		for(Integer s:set ){
			clist.add(carService.selectByPrimaryKey(s));	
		}
		return new ModelAndView("site/recommend","clist",clist);
	}

	@RequestMapping("/frontProinfo")		//进入前台车辆详情页
	public ModelAndView frontProinfo(Integer cid){
		Car car= carService.selectByPrimaryKey(cid);
		//先把购买时间取出来，并且截取字符串取前4位，用2018减去得到的整型值+1，结果就是当前车的车龄
		Integer buytime = 2018 - Integer.parseInt(car.getBuytime().substring(0, 4)) + 1;
		car.setBuytime(String.valueOf(buytime));
		return new ModelAndView("site/proinfo","car",car);
	}
	
	@RequestMapping("/frontReturnCar")		//前台归还车辆
	public String frontReturnCar(Integer cid){
		Car car= carService.selectByPrimaryKey(cid);
		car.setCflag(0);
		car.setUid(null);
		carService.updateByPrimaryKeySelective(car);
		return "redirect:frontOrderlist";
	}
	
}
