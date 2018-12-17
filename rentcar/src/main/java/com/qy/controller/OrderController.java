package com.qy.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.qy.pojo.Car;
import com.qy.pojo.Category1;
import com.qy.pojo.Order;
import com.qy.pojo.User;
import com.qy.service.CarService;
import com.qy.service.OrderService;
import com.qy.service.UserService;
import com.qy.util.Paging;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;
	@Autowired
	private CarService carService;
	@Autowired
	private UserService userService;

	@RequestMapping("/orderList")
	@ResponseBody
	public Map orderList(Integer pagecount) {
		Map map = new HashMap();
		List<Order> olist = orderService.selectAllOrder();
		for (Order order : olist) {
			order.setUser(userService.selectByPrimaryKey(order.getUid()));
			order.setCar(carService.selectByPrimaryKey(order.getCid()));
		}
		Paging<Order> pagging = new Paging(8, pagecount, olist);
		map.put("olist", pagging);

		return map;
	}

	@RequestMapping("/delorder")
	@ResponseBody
	public Map delorder(int oid) {
		Map map = new HashMap();
		map.put("row", orderService.deleteByPrimaryKey(oid));
		return map;
	}

	@RequestMapping("/loadorder")
	@ResponseBody
	public Map loadorder(int oid) {
		Map map = new HashMap();
		Order order = orderService.selectByPrimaryKey(oid);
		order.setOtime1(order.getOtime().substring(0, 10) + "T" + order.getOtime().substring(11, 16));
		;
		order.setBegin1(order.getBegin().substring(0, 10) + "T" + order.getBegin().substring(11, 16));
		;
		order.setEnd1(order.getEnd().substring(0, 10) + "T" + order.getEnd().substring(11, 16));
		;
		map.put("order", order);
		return map;
	}

	@RequestMapping("/insertorder")
	@ResponseBody
	public Map insertorder(Order order) {
		Map map = new HashMap();
		map.put("row", orderService.insert(order));
		return map;
	}

	@RequestMapping("/updateorder")
	@ResponseBody
	public Map updateorder(Order order) {
		Map map = new HashMap();
		map.put("row", orderService.updateByPrimaryKeySelective(order));
		return map;
	}

	// --------------------------------------------------------------------
	@RequestMapping("/frontOrderlist") // 前台订单的页面
	public ModelAndView frontOrderlist(HttpServletRequest request, HttpServletResponse response) {
		Cookie[] cs = request.getCookies();
		boolean b = false;
		String username = null;
		Integer uid = null;
		if (cs != null) {
			for (Cookie c : cs) {
				if (c.getName().equals("user")) {
					b = true;
					username = c.getValue();
					break;
				}
			}
		}
		if (username != null) {
			for (Cookie c : cs) {
				if (c.getName().equals("userId")) {
					b = true;
					uid = Integer.parseInt(c.getValue());
					break;
				}
			}
		}
		if (b) {
			List<Order> olist = orderService.selectByUid(uid);
			for (Order order : olist) {
				order.setCar(carService.selectByPrimaryKey(order.getCid()));
			}
			ModelAndView mav = new ModelAndView("site/order", "olist", olist);
			User user = userService.selectByPrimaryKey(uid);
			mav.addObject("user", user);
			//传已租赁但是未归还的车辆
			List<Car> clist = carService.selectByUserId(uid);
			if(clist.size()>0){
				mav.addObject("clist", clist);
				mav.addObject("clistSize", clist.size());
			}
			return mav;
		} else {
			return new ModelAndView("site/login");
		}
	}
	
	@RequestMapping("/confirmOrder")
	public ModelAndView confirmOrder(Order order,Integer daycount,
			HttpServletRequest request){
		Cookie[] cs = request.getCookies();
		boolean b = false;
		String username = null;
		Integer uid = null;
		if (cs != null) {
			for (Cookie c : cs) {
				if (c.getName().equals("user")) {
					b = true;
					username = c.getValue();
					break;
				}
			}
		}
		if (b) {
			Double totalprice = 0.0;
			Car car = carService.selectByPrimaryKey(order.getCid());
			totalprice = daycount * car.getPrice();
			ModelAndView mav = new ModelAndView("site/confirmOrder", "car", car);
			mav.addObject("daycount", daycount);
			mav.addObject("totalprice", totalprice);
			return mav;
		}else{
			return new ModelAndView("site/login");
		}
	}
	

	@RequestMapping("/submitOrder")
	@ResponseBody
	public Map submitOrder(Order order,Integer daycount,
			HttpServletRequest request){
		Map map = new HashMap();
		Cookie[] cs = request.getCookies();
		boolean b = false;
		String username = null;
		Integer uid = null;
		if (cs != null) {
			for (Cookie c : cs) {
				if (c.getName().equals("user")) {
					b = true;
					username = c.getValue();
					break;
				}
			}
		}
		if (username != null) {
			for (Cookie c : cs) {
				if (c.getName().equals("userId")) {
					b = true;
					uid = Integer.parseInt(c.getValue());
					break;
				}
			}
		} 
		if (b) {
			Double totalprice = 0.0;
			Car car = carService.selectByPrimaryKey(order.getCid());
			car.setCflag(1);
			car.setUid(uid);
			carService.updateByPrimaryKeySelective(car);
			totalprice = daycount * car.getPrice();
			order.setTotalprice(totalprice);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
			order.setOtime(sdf.format(new Date()));
			order.setBegin(sdf.format(new Date()));
			Calendar calendar =Calendar.getInstance();
			calendar.setTime(new Date());
			calendar.add(Calendar.DAY_OF_MONTH, daycount);
			order.setEnd(sdf.format(calendar.getTime()));
			order.setUid(uid);
			order.setOflag(1);
			map.put("row", orderService.insert(order));
		}else{
			map.put("row", -1);
		}
		return map;
	}

}
