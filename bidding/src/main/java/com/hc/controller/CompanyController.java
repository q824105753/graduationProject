package com.hc.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hc.pojo.Address;
import com.hc.pojo.Compact;
import com.hc.pojo.Company;
import com.hc.pojo.Notice;
import com.hc.pojo.Tender;
import com.hc.pojo.User;
import com.hc.service.AddressService;
import com.hc.service.CompactService;
import com.hc.service.CompanyService;
import com.hc.service.NoticeService;
import com.hc.service.TenderService;
import com.hc.service.UserService;

import cn.itcast.common.page.Pagination;

@Controller
public class CompanyController {

	@Autowired
	private CompanyService companyService;
	@Autowired
	private UserService userService;
	@Autowired
	private AddressService addressService;
	@Autowired
	private TenderService tenderService;
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private CompactService compactService; 

	@RequestMapping("/admin/selectAllCompanyByPage")
	public ModelAndView selectAllCompanyByPage(Company company1,Integer pageNo) {
		if(pageNo==null) {
			pageNo=1;
		}
//		if(company1.getSize()==null) {
//			company1.setSize(8);
//		}
//		List<Company> clist = companyService.selectAllCompany(company,pageNo);
		Pagination page = companyService.selectAllCompanyByPage(company1,pageNo);
		List clist = page.getList();
		for (Object company2 : clist) {
			Company company = (Company)company2;
			company.setUser(userService.selectByPrimaryKey(company.getUserid()));
			Address address = addressService.selectByPrimaryKey(company.getAddressid());
			company.setAddress(address);
		}
		ModelAndView mav = new ModelAndView("/admin/company", "clist", page);
		mav.addObject("companyname", company1.getCompanyname());
		mav.addObject("companyCount",companyService.selectCompanyCount(company1));
		return mav;
	}

	// 去添加页面
	@RequestMapping("/admin/companyAdd")
	public ModelAndView companyAdd() {
		return new ModelAndView("/admin/company-add", "ulist", userService.selectAllUser());
	}

	// 去修改页面
	@RequestMapping("/admin/companyUpdate")
	public ModelAndView companyUpdate() {
		return new ModelAndView("/admin/company-update", "ulist", userService.selectAllUser());
	}

	@RequestMapping("/admin/insertCompany")
	public String insertCompany(Company company,Address address) {
//		int addressid= addressService.insert(address);
//		System.out.println(addressService.insert(address)+"==============");
		company.setAddressid((long)addressService.insert(address));
		companyService.insert(company);
		
		return "redirect:/admin/selectAllCompanyByPage";
	}

	@RequestMapping("/admin/delCompany")
	public String delCompany(Long companyid) {
		companyService.deleteByPrimaryKey(companyid);
		return "redirect:/admin/selectAllCompanyByPage";
	}

	@RequestMapping("/admin/updateCompany")
	public String updateCompany(Company company,Address address) {
		companyService.updateByPrimaryKeySelective(company);
		addressService.updateByPrimaryKeySelective(address);
		return "redirect:/admin/selectAllCompanyByPage";
	}
	
	@RequestMapping("/admin/loadCompany")
	public ModelAndView loadCompany(Long companyid) {
		ModelAndView mav = new ModelAndView("/admin/company-update", "ulist", userService.selectAllUser());
		Company company = companyService.selectByPrimaryKey(companyid);
		mav.addObject("company",company);
		company.setAddress(addressService.selectByPrimaryKey(company.getAddressid()));
		return mav;
	}
	//--------------招标人------------------------------------------------
	
	@RequestMapping("/bid/selectCompany")
	public ModelAndView bidselectCompany(HttpSession session) {
		User user = (User)session.getAttribute("user");
		Company company = companyService.selectCompanyByUid(user.getUserid());
		Address address = addressService.selectByPrimaryKey(company.getAddressid());
		company.setAddress(address);
		company.setUser(userService.selectByPrimaryKey(user.getUserid()));
		ModelAndView mav = new ModelAndView("/bid/company", "company", company);
		return mav;
	}
	// 去添加页面
		@RequestMapping("/bid/companyAdd")
		public ModelAndView bidcompanyAdd() {
			return new ModelAndView("/bid/company-add", "ulist", userService.selectAllUser());
		}

		// 去修改页面
		@RequestMapping("/bid/companyUpdate")
		public ModelAndView bidcompanyUpdate() {
			return new ModelAndView("/bid/company-update", "ulist", userService.selectAllUser());
		}

		@RequestMapping("/bid/insertCompany")
		public String bidinsertCompany(Company company,Address address) {
			company.setAddressid((long)addressService.insert(address));
			companyService.insert(company);
			
			return "redirect:/bid/selectCompany";
		}

		@RequestMapping("/bid/delCompany")
		public String biddelCompany(Long companyid) {
			companyService.deleteByPrimaryKey(companyid);
			return "redirect:/bid/selectCompany";
		}

		@RequestMapping("/bid/updateCompany")
		public String bidupdateCompany(Company company,Address address) {
			companyService.updateByPrimaryKeySelective(company);
			addressService.updateByPrimaryKeySelective(address);
			return "redirect:/bid/selectCompany";
		}
		
		@RequestMapping("/bid/loadCompany")
		public ModelAndView bidloadCompany(Long companyid) {
			ModelAndView mav = new ModelAndView("/bid/company-update", "ulist", userService.selectAllUser());
			Company company = companyService.selectByPrimaryKey(companyid);
			mav.addObject("company",company);
			company.setAddress(addressService.selectByPrimaryKey(company.getAddressid()));
			return mav;
		}
	
	
	
	//------------------前台-----------------------------------------
	@RequestMapping("/goodCompany")
	public ModelAndView goodCompany() {
		
		List<Map> tlist = new ArrayList<Map>();
		List<Map> zlist = new ArrayList<Map>();
		
		List<Compact> clist = compactService.selectAllCompact();
		for (Compact compact : clist) {
			//从合同对象中提取投标申请id，从而获得的对象
			Tender tender = tenderService.selectByPrimaryKey(compact.getTenderid());
			
			Company tCompany = companyService.selectByPrimaryKey(tender.getCompanyid());
			Address tAddress = addressService.selectByPrimaryKey(tCompany.getAddressid());
			User tUser = userService.selectByPrimaryKey(tender.getUserid());
			Map tmap = new HashMap();
			tmap.put("creattime", compact.getCreatetime());
			tmap.put("address", tAddress.getAddressname());
			tmap.put("companyName", tCompany.getCompanyname());
			tmap.put("userName", tUser.getName());
			tmap.put("itemName", tender.getTendername());
			tlist.add(tmap);
			
			Notice notice = noticeService.selectByPrimaryKey(tender.getBidid());
			Company zCompany = companyService.selectByPrimaryKey(notice.getCompanyid());
			Address zAddress = addressService.selectByPrimaryKey(zCompany.getAddressid());
			User zUser = userService.selectByPrimaryKey(notice.getUserid());
			Map zmap = new HashMap();
			zmap.put("creattime", compact.getCreatetime());
			zmap.put("address", zAddress.getAddressname());
			zmap.put("companyName", zCompany.getCompanyname());
			zmap.put("userName", zUser.getName());
			zmap.put("itemName", notice.getItemname());
			zlist.add(zmap);
		}
		
		ModelAndView mav = new ModelAndView("/company");
		mav.addObject("tlist", tlist);
		mav.addObject("zlist", zlist);
		return mav;
	}
	
	
	
	
	
	
	
	
}
