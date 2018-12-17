package com.hc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.swing.plaf.synth.SynthScrollBarUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;

import com.alibaba.druid.stat.TableStat.Mode;
import com.hc.pojo.Address;
import com.hc.pojo.Company;
import com.hc.pojo.Notice;
import com.hc.pojo.User;
import com.hc.service.AddressService;
import com.hc.service.CompanyService;
import com.hc.service.NoticeService;
import com.hc.service.UserService;

import cn.itcast.common.page.Pagination;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	@Autowired
	private CompanyService companyService;
	@Autowired
	private UserService userService;
	@Autowired
	private AddressService addressService;
	
	@RequestMapping("/admin/selectAllNoticeByPage")
	public ModelAndView selectAllNoticeByPage(Notice notice1,Integer pageNo){
		if(pageNo==null) {
			pageNo=1;
		}
		if(notice1.getSize()==null) {
			notice1.setSize(8);
		}
		Pagination page = noticeService.selectAllNoticeByPage(notice1, pageNo);
		List nlist = page.getList();
		for (Object notice2 : nlist) {
			Notice notice = (Notice)notice2;
			notice.setCompany(companyService.selectByPrimaryKey(notice.getCompanyid()));
			notice.setAddress(addressService.selectByPrimaryKey(notice.getAddressid()));
			notice.setUser(userService.selectByPrimaryKey(notice.getUserid()));
		}
		ModelAndView mav = new ModelAndView("/admin/notice","nlist",page);
		mav.addObject("company", companyService.selectAllCompany());
		mav.addObject("noticeCount",noticeService.selectNoticeCount(notice1));
		return mav;
	}
	
	@RequestMapping("/admin/selectByNoticeDel")
	public ModelAndView selectByNoticeDel(){
		List<Notice> nlist = noticeService.selectByNoticeDel();
		for (Notice notice : nlist) {
			notice.setCompany(companyService.selectByPrimaryKey(notice.getCompanyid()));
			notice.setAddress(addressService.selectByPrimaryKey(notice.getAddressid()));
			notice.setUser(userService.selectByPrimaryKey(notice.getUserid()));
		}
		ModelAndView mav = new ModelAndView("/admin/notice-del","nlist",nlist);
		mav.addObject("company", companyService.selectAllCompany());
		
		return mav;
	}
	
	@RequestMapping("/admin/toNoticeAdd")
	public ModelAndView toNoticeAdd(){
		ModelAndView mav = new ModelAndView("/admin/notice-add","company", companyService.selectAllCompany());
		mav.addObject("ulist", userService.selectAllUser());
		return mav;
	}
	
	@RequestMapping("/admin/insertNotice")
	public String insertNotice(Notice notice,Address address){
		notice.setAddressid((long)addressService.insert(address));
		Long companyid = notice.getCompanyid();
		Company company = companyService.selectByPrimaryKey(companyid);
		notice.setUserid(company.getUserid());
		noticeService.insert(notice);
		return "redirect:/admin/selectAllNoticeByPage";
	}
	
	@RequestMapping("/admin/delNotice")
	public String delNotice(Long noticeid){
		noticeService.deleteByPrimaryKey(noticeid);
		return "redirect:/admin/selectByNoticeDel";
	}
	
	
	@RequestMapping("/admin/softDelNotice")
	public String softDelNotice(Long noticeid){
		Notice notice = noticeService.selectByPrimaryKey(noticeid);
		notice.setIsdelete(1);
		noticeService.updateByPrimaryKeySelective(notice);
		return "redirect:/admin/selectAllNoticeByPage";
	}
	@RequestMapping("/admin/resetNotice")
	public String resetNotice(Long noticeid){
		Notice notice = noticeService.selectByPrimaryKey(noticeid);
		notice.setIsdelete(0);
		noticeService.updateByPrimaryKeySelective(notice);
		return "redirect:/admin/selectByNoticeDel";
	}
	
	
	@RequestMapping("/admin/loadNotice")
	public ModelAndView loadNotice(Long noticeid){
		
		List<Company> company = companyService.selectAllCompany();
		ModelAndView mav = new ModelAndView("/admin/notice-update","company", company);
		mav.addObject("ulist", userService.selectAllUser());
		Notice notice = noticeService.selectByPrimaryKey(noticeid);
		notice.setAddress(addressService.selectByPrimaryKey(notice.getAddressid()));
		notice.setNoticebegintime1(notice.getNoticebegintime().substring(0, 10)+"T"+notice.getNoticebegintime().substring(11, 16));
		notice.setNoticestoptime1(notice.getNoticestoptime().substring(0, 10)+"T"+notice.getNoticestoptime().substring(11, 16));
		notice.setCreatetime1(notice.getCreatetime().substring(0, 10)+"T"+notice.getCreatetime().substring(11, 16));
		mav.addObject("notice", notice);
		return mav;
	}
	
	@RequestMapping("/admin/updateNotice")
	public String updateNotice(Notice notice,Address address){
		addressService.updateByPrimaryKeySelective(address);
		Long companyid = notice.getCompanyid();
		Company company = companyService.selectByPrimaryKey(companyid);
		notice.setUserid(company.getUserid());
		noticeService.updateByPrimaryKeySelective(notice);
		return "redirect:/admin/selectAllNoticeByPage";
	}
	
	@RequestMapping("/admin/noticeDetail")
	public ModelAndView noticeDetail(Long noticeid){
		Notice notice = noticeService.selectByPrimaryKey(noticeid);
		return new ModelAndView("admin/noticeDetail","noticeDetail",notice.getDetail());
	}
	
	
	
//-------------招标人-----------------------------------------------------
	
	@RequestMapping("/bid/selectNotice")
	public ModelAndView bidselectNotice(Notice notice1,Integer pageNo){
		if(pageNo==null) {
			pageNo=1;
		}
		if(notice1.getSize()==null) {
			notice1.setSize(8);
		}
		Pagination page = noticeService.selectAllNoticeByPage(notice1, pageNo);
		List nlist = page.getList();
		for (Object notice2 : nlist) {
			Notice notice = (Notice)notice2;
			notice.setCompany(companyService.selectByPrimaryKey(notice.getCompanyid()));
			notice.setAddress(addressService.selectByPrimaryKey(notice.getAddressid()));
			notice.setUser(userService.selectByPrimaryKey(notice.getUserid()));
		}
		ModelAndView mav = new ModelAndView("/bid/notice","nlist",page);
		mav.addObject("company", companyService.selectAllCompany());
		mav.addObject("noticeCount",noticeService.selectNoticeCount(notice1));
		return mav;
	}
	
	@RequestMapping("/bid/selectByNoticeDel")
	public ModelAndView bidselectByNoticeDel(){
		List<Notice> nlist = noticeService.selectByNoticeDel();
		for (Notice notice : nlist) {
			notice.setCompany(companyService.selectByPrimaryKey(notice.getCompanyid()));
			notice.setAddress(addressService.selectByPrimaryKey(notice.getAddressid()));
			notice.setUser(userService.selectByPrimaryKey(notice.getUserid()));
		}
		ModelAndView mav = new ModelAndView("/bid/notice-del","nlist",nlist);
		mav.addObject("company", companyService.selectAllCompany());
		return mav;
	}
	
	@RequestMapping("/bid/toNoticeAdd")
	public ModelAndView bidtoNoticeAdd(){
		ModelAndView mav = new ModelAndView("/bid/notice-add","company", companyService.selectAllCompany());
		mav.addObject("ulist", userService.selectAllUser());
		return mav;
	}
	
	@RequestMapping("/bid/insertNotice")
	public String bidinsertNotice(Notice notice,Address address){
		notice.setAddressid((long)addressService.insert(address));
		Long companyid = notice.getCompanyid();
		Company company = companyService.selectByPrimaryKey(companyid);
		notice.setUserid(company.getUserid());
		noticeService.insert(notice);
		return "redirect:/bid/selectNotice";
	}
	
	@RequestMapping("/bid/delNotice")
	public String biddelNotice(Long noticeid){
		noticeService.deleteByPrimaryKey(noticeid);
		return "redirect:/bid/selectByNoticeDel";
	}
	
	
	@RequestMapping("/bid/softDelNotice")
	public String bidsoftDelNotice(Long noticeid){
		Notice notice = noticeService.selectByPrimaryKey(noticeid);
		notice.setIsdelete(1);
		noticeService.updateByPrimaryKeySelective(notice);
		return "redirect:/bid/selectNotice";
	}
	@RequestMapping("/bid/resetNotice")
	public String bidresetNotice(Long noticeid){
		Notice notice = noticeService.selectByPrimaryKey(noticeid);
		notice.setIsdelete(0);
		noticeService.updateByPrimaryKeySelective(notice);
		return "redirect:/bid/selectByNoticeDel";
	}
	
	
	@RequestMapping("/bid/loadNotice")
	public ModelAndView bidloadNotice(Long noticeid){
		
		List<Company> company = companyService.selectAllCompany();
		ModelAndView mav = new ModelAndView("/bid/notice-update","company", company);
		mav.addObject("ulist", userService.selectAllUser());
		Notice notice = noticeService.selectByPrimaryKey(noticeid);
		notice.setAddress(addressService.selectByPrimaryKey(notice.getAddressid()));
		notice.setNoticebegintime1(notice.getNoticebegintime().substring(0, 10)+"T"+notice.getNoticebegintime().substring(11, 16));
		notice.setNoticestoptime1(notice.getNoticestoptime().substring(0, 10)+"T"+notice.getNoticestoptime().substring(11, 16));
		notice.setCreatetime1(notice.getCreatetime().substring(0, 10)+"T"+notice.getCreatetime().substring(11, 16));
		mav.addObject("notice", notice);
		return mav;
	}
	
	@RequestMapping("/bid/updateNotice")
	public String bidupdateNotice(Notice notice,Address address){
		addressService.updateByPrimaryKeySelective(address);
		Long companyid = notice.getCompanyid();
		Company company = companyService.selectByPrimaryKey(companyid);
		notice.setUserid(company.getUserid());
		noticeService.updateByPrimaryKeySelective(notice);
		return "redirect:/bid/selectNotice";
	}
	
	@RequestMapping("/bid/noticeDetail")
	public ModelAndView bidnoticeDetail(Long noticeid){
		Notice notice = noticeService.selectByPrimaryKey(noticeid);
		return new ModelAndView("bid/noticeDetail","noticeDetail",notice.getDetail());
	}
	
//-------------前台-----------------------------------------------------
	@RequestMapping("/selectAllNoticeFront")
	public ModelAndView selectAllNoticeFront(Notice notice1,Integer pageNo){
		if(pageNo==null) {
			pageNo=1;
		}
		if(notice1.getSize()==null) {
			notice1.setSize(6);
		}
		Pagination page = noticeService.selectAllNoticeFront(notice1, pageNo);
		ModelAndView mav = new ModelAndView("bidding","page",page);
		return mav;
	}
	
	@RequestMapping("/frontNotice")
	@ResponseBody
	public Map<String, Notice> frontNotice(Long noticeid) {
		Map<String, Notice> map = new HashMap<String, Notice>();
		Notice notice = noticeService.selectByPrimaryKey(noticeid);
		Company company = companyService.selectByPrimaryKey(notice.getCompanyid());
		notice.setCompany(company);
		User user = userService.selectByPrimaryKey(notice.getUserid());
		notice.setUser(user);
		map.put("notice", notice);
		return map;
	}

	@RequestMapping("/noticeList")
	@ResponseBody
	public Map noticeList(){
		Map<String, List<Notice>> map = new HashMap<String, List<Notice>>();
		map.put("noticeList",noticeService.selectAllNotice());
		return map;
	}
	
}
