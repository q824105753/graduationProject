package com.hc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hc.pojo.Company;
import com.hc.pojo.Notice;
import com.hc.pojo.Tender;
import com.hc.pojo.User;
import com.hc.service.CompanyService;
import com.hc.service.NoticeService;
import com.hc.service.TenderService;
import com.hc.service.UserService;

@Controller
public class IndexController {
	@Autowired
	private UserService userService;
	@Autowired
	private CompanyService companyService;
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private TenderService tenderService;
	
	@RequestMapping("admin/index")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView("/admin/index","userCount",userService.selectUserCount(new User()));
		mav.addObject("companyCount", companyService.selectCompanyCount(new Company()));
		mav.addObject("tenderCount", tenderService.selectTenderCount(new Tender()));
		mav.addObject("noticeCount", noticeService.selectNoticeCount(new Notice()));
		return mav;
	}
	
	@RequestMapping("bid/index")
	public ModelAndView bidindex() {
		ModelAndView mav = new ModelAndView("/bid/index","userCount",userService.selectUserCount(new User()));
		mav.addObject("companyCount", companyService.selectCompanyCount(new Company()));
		mav.addObject("tenderCount", tenderService.selectTenderCount(new Tender()));
		mav.addObject("noticeCount", noticeService.selectNoticeCount(new Notice()));
		return mav;
	}
}
