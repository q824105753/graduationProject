package com.hc.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hc.pojo.Address;
import com.hc.pojo.Check;
import com.hc.pojo.Company;
import com.hc.pojo.Notice;
import com.hc.pojo.Tender;
import com.hc.pojo.User;
import com.hc.service.CheckService;
import com.hc.service.CompanyService;
import com.hc.service.NoticeService;
import com.hc.service.TenderService;
import com.hc.service.UserService;
import com.sun.tools.corba.se.idl.constExpr.Not;

import cn.itcast.common.page.Pagination;

@Controller
public class TenderController {
	
	@Autowired
	private TenderService tenderService;
	@Autowired
	private CompanyService companyService;
	@Autowired
	private UserService userService;
	@Autowired
	private CheckService checkService;
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("/admin/selectAllTenderByPage")
	public ModelAndView selectAllTenderByPage(Tender tender1,Integer pageNo) {
		if(pageNo==null) {
			pageNo=1;
		}
		if(tender1.getSize()==null) {
			tender1.setSize(8);
		}
		Pagination page = tenderService.selectAllTenderByPage(tender1, pageNo);
		List tlist = page.getList();
		for (Object tender2 : tlist) {
			Tender tender = (Tender)tender2;
			tender.setCompany(companyService.selectByPrimaryKey(tender.getCompanyid()));
			tender.setUser(userService.selectByPrimaryKey(tender.getUserid()));
			tender.setNotice(noticeService.selectByPrimaryKey(tender.getBidid()));
			tender.setCheck(checkService.selectByPrimaryKey(tender.getCheckid()));
		}
		ModelAndView mav = new ModelAndView("admin/tender","tlist",page);
		mav.addObject("tenderCount", tenderService.selectTenderCount(tender1));
		return mav;
	}
	
	@RequestMapping("/admin/toInsertTender")
	public ModelAndView toInsertTender() {
		List<Company> list = companyService.selectAllCompany();
		List<Company> zlist = new ArrayList<Company>();
		List<Company> tlist = new ArrayList<Company>();
		for (Company company : list) {
			Long uid = company.getUserid();
			User user = userService.selectByPrimaryKey(uid);
			if(user.getFlag()==0||user.getFlag()==2) {
				zlist.add(company);
			}
			if(user.getFlag()==1||user.getFlag()==2) {
				tlist.add(company);
			}
		}
		ModelAndView mav = new ModelAndView("admin/tender-add","zlist",zlist);
		List<User> ulist = userService.selectAllUser();
		List<Check> clist = checkService.selectAllCheck();
		mav.addObject("clist",clist);
		mav.addObject("ulist",ulist);
		mav.addObject("tlist",tlist);
		return mav;
	}
	
	@RequestMapping("/admin/insertTender")
	public String insertTender(Tender tender) {
		tender.setUserid(companyService.selectByPrimaryKey(tender.getCompanyid()).getUserid());;
		tenderService.insert(tender);
		return "redirect:/admin/selectAllTenderByPage";
	}
	
	@RequestMapping("/admin/toSoftDeleteTender")
	public ModelAndView toSoftDeleteTender() {
		List<Tender> tlist = tenderService.softDeleteTender();
		for (Tender tender : tlist) {
			tender.setCompany(companyService.selectByPrimaryKey(tender.getCompanyid()));
			tender.setUser(userService.selectByPrimaryKey(tender.getUserid()));
			tender.setNotice(noticeService.selectByPrimaryKey(tender.getBidid()));
			tender.setCheck(checkService.selectByPrimaryKey(tender.getCheckid()));
		}
		return new ModelAndView("admin/tender-del","tlist",tlist);
	}
	
	@RequestMapping("/admin/softDelTender")
	public String softDelTender(Long tenderid) {
		Tender tender = tenderService.selectByPrimaryKey(tenderid);
		tender.setIsdelete(1);
		tenderService.updateByPrimaryKeySelective(tender);
		return "redirect:/admin/selectAllTenderByPage";
	}
	
	@RequestMapping("/admin/delTender")
	public String delTender(Long tenderid) {
		tenderService.deleteByPrimaryKey(tenderid);
		return "redirect:/admin/toSoftDeleteTender";
	}
	
	@RequestMapping("/admin/resetTender")
	public String resetTender(Long tenderid) {
		Tender tender = tenderService.selectByPrimaryKey(tenderid);
		tender.setIsdelete(0);
		tenderService.updateByPrimaryKeySelective(tender);
		return "redirect:/admin/toSoftDeleteTender";
	}
	
	
	@RequestMapping("/admin/loadTender")
	public ModelAndView loadTender(Long tenderid) {
		List<Company> list = companyService.selectAllCompany();
		List<Company> zlist = new ArrayList<Company>();
		List<Company> tlist = new ArrayList<Company>();
		for (Company company : list) {
			if(userService.selectByPrimaryKey(company.getUserid()).getFlag()==0||userService.selectByPrimaryKey(company.getUserid()).getFlag()==2) {
				zlist.add(company);
			}
			if(userService.selectByPrimaryKey(company.getUserid()).getFlag()==1||userService.selectByPrimaryKey(company.getUserid()).getFlag()==2) {
				tlist.add(company);
			}
		}
		ModelAndView mav = new ModelAndView("admin/tender-update","zlist",zlist);
		List<Notice> nlist = noticeService.selectAllNotice();
		List<User> ulist = userService.selectAllUser();
		List<Check> clist = checkService.selectAllCheck();
		mav.addObject("clist",clist);
		mav.addObject("ulist",ulist);
		mav.addObject("nlist",nlist);
		
		Tender tender = tenderService.selectByPrimaryKey(tenderid);
		tender.setFinishtime1(tender.getFinishtime().substring(0, 10)+"T"+tender.getFinishtime().substring(11, 16));
		mav.addObject("tender", tender);
		return mav;
	}
	
	@RequestMapping("/admin/updateTender")
	public String updateTender(Tender tender) {
		System.out.println("+++++"+tender);
		tender.setUserid(companyService.selectByPrimaryKey(tender.getCompanyid()).getUserid());;
		tenderService.updateByPrimaryKeySelective(tender);
		return "redirect:/admin/selectAllTenderByPage";
	}
	
// ------------招标人------------------------------------------------------------
	
	@RequestMapping("/bid/selectTender")
	public ModelAndView bidselectAllTenderByPage(Tender tender1,Integer pageNo) {
		if(pageNo==null) {
			pageNo=1;
		}
		if(tender1.getSize()==null) {
			tender1.setSize(8);
		}
		Pagination page = tenderService.selectAllTenderByPage(tender1, pageNo);
		List tlist = page.getList();
		for (Object tender2 : tlist) {
			Tender tender = (Tender)tender2;
			tender.setCompany(companyService.selectByPrimaryKey(tender.getCompanyid()));
			tender.setUser(userService.selectByPrimaryKey(tender.getUserid()));
			tender.setNotice(noticeService.selectByPrimaryKey(tender.getBidid()));
			tender.setCheck(checkService.selectByPrimaryKey(tender.getCheckid()));
		}
		ModelAndView mav = new ModelAndView("bid/tender","tlist",page);
		mav.addObject("tenderCount", tenderService.selectTenderCount(tender1));
		return mav;
	}
	
	@RequestMapping("/bid/toInsertTender")
	public ModelAndView bidtoInsertTender() {
		List<Company> list = companyService.selectAllCompany();
		List<Company> zlist = new ArrayList<Company>();
		List<Company> tlist = new ArrayList<Company>();
		for (Company company : list) {
			Long uid = company.getUserid();
			User user = userService.selectByPrimaryKey(uid);
			if(user.getFlag()==0||user.getFlag()==2) {
				zlist.add(company);
			}
			if(user.getFlag()==1||user.getFlag()==2) {
				tlist.add(company);
			}
		}
		ModelAndView mav = new ModelAndView("bid/tender-add","zlist",zlist);
		List<User> ulist = userService.selectAllUser();
		List<Check> clist = checkService.selectAllCheck();
		mav.addObject("clist",clist);
		mav.addObject("ulist",ulist);
		mav.addObject("tlist",tlist);
		return mav;
	}
	
	@RequestMapping("/bid/insertTender")
	public String bidinsertTender(Tender tender) {
		tender.setUserid(companyService.selectByPrimaryKey(tender.getCompanyid()).getUserid());;
		tenderService.insert(tender);
		return "redirect:/bid/selectTender";
	}
	
	@RequestMapping("/bid/toSoftDeleteTender")
	public ModelAndView bidtoSoftDeleteTender() {
		List<Tender> tlist = tenderService.softDeleteTender();
		for (Tender tender : tlist) {
			tender.setCompany(companyService.selectByPrimaryKey(tender.getCompanyid()));
			tender.setUser(userService.selectByPrimaryKey(tender.getUserid()));
			tender.setNotice(noticeService.selectByPrimaryKey(tender.getBidid()));
			tender.setCheck(checkService.selectByPrimaryKey(tender.getCheckid()));
		}
		return new ModelAndView("bid/tender-del","tlist",tlist);
	}
	
	@RequestMapping("/bid/softDelTender")
	public String bidsoftDelTender(Long tenderid) {
		Tender tender = tenderService.selectByPrimaryKey(tenderid);
		tender.setIsdelete(1);
		tenderService.updateByPrimaryKeySelective(tender);
		return "redirect:/bid/selectTender";
	}
	
	@RequestMapping("/bid/delTender")
	public String biddelTender(Long tenderid) {
		tenderService.deleteByPrimaryKey(tenderid);
		return "redirect:/bid/toSoftDeleteTender";
	}
	
	@RequestMapping("/bid/resetTender")
	public String bidresetTender(Long tenderid) {
		Tender tender = tenderService.selectByPrimaryKey(tenderid);
		tender.setIsdelete(0);
		tenderService.updateByPrimaryKeySelective(tender);
		return "redirect:/bid/toSoftDeleteTender";
	}
	
	
	@RequestMapping("/bid/loadTender")
	public ModelAndView bidloadTender(Long tenderid) {
		List<Company> list = companyService.selectAllCompany();
		List<Company> zlist = new ArrayList<Company>();
		List<Company> tlist = new ArrayList<Company>();
		for (Company company : list) {
			if(userService.selectByPrimaryKey(company.getUserid()).getFlag()==0||userService.selectByPrimaryKey(company.getUserid()).getFlag()==2) {
				zlist.add(company);
			}
			if(userService.selectByPrimaryKey(company.getUserid()).getFlag()==1||userService.selectByPrimaryKey(company.getUserid()).getFlag()==2) {
				tlist.add(company);
			}
		}
		ModelAndView mav = new ModelAndView("bid/tender-update","zlist",zlist);
		List<Notice> nlist = noticeService.selectAllNotice();
		List<User> ulist = userService.selectAllUser();
		List<Check> clist = checkService.selectAllCheck();
		mav.addObject("clist",clist);
		mav.addObject("ulist",ulist);
		mav.addObject("nlist",nlist);
		
		Tender tender = tenderService.selectByPrimaryKey(tenderid);
		tender.setFinishtime1(tender.getFinishtime().substring(0, 10)+"T"+tender.getFinishtime().substring(11, 16));
		mav.addObject("tender", tender);
		return mav;
	}
	
	@RequestMapping("/bid/updateTender")
	public String bidupdateTender(Tender tender) {
		System.out.println("+++++"+tender);
		tender.setUserid(companyService.selectByPrimaryKey(tender.getCompanyid()).getUserid());;
		tenderService.updateByPrimaryKeySelective(tender);
		return "redirect:/bid/selectTender";
	}
	
// ------------前台------------------------------------------------------------
	
	@RequestMapping("/selectAllByState")//首页，显示已经签约的项目
	public ModelAndView selectAllByState(Tender tender1,Integer pageNo) {
		if (pageNo == null) {
			pageNo = 1;
		}
		if(tender1.getSize()==null) {
			tender1.setSize(6);
		}
		ModelAndView mav = new ModelAndView("index", "page", tenderService.selectAllByState(tender1, pageNo));
		return mav;
	}
	
	@RequestMapping("/selectAllTenderFront")//显示所有的投标申请
	public ModelAndView selectAllTenderFront(Tender tender1,Integer pageNo) {
		if(pageNo==null) {
			pageNo=1;
		}
		if(tender1.getSize()==null) {
			tender1.setSize(4);
		}
		Pagination page = tenderService.selectAllTenderFront(tender1, pageNo);
		List tlist = page.getList();
		for (Object tender2 : tlist) {
			Tender tender = (Tender)tender2;
			tender.setCompany(companyService.selectByPrimaryKey(tender.getCompanyid()));
			tender.setUser(userService.selectByPrimaryKey(tender.getUserid()));
			tender.setCompany1(companyService.selectByPrimaryKey(tender.getBidid()));
			tender.setCheck(checkService.selectByPrimaryKey(tender.getCheckid()));
		}
		ModelAndView mav = new ModelAndView("tender","page",page);
		return mav;
	}

	@RequestMapping("/insertTenderFront")			//前台添加投标申请
	@ResponseBody
	public Map insertTenderFront(Tender tender,HttpSession session){
		System.out.println("   bidid   "+tender.getBidid());
		Map<String, Integer> map = new HashMap<String,Integer>();
		User user = (User)session.getAttribute("user");
		tender.setUserid(user.getUserid());
		System.out.println(tender.getUserid());
		Company company = companyService.selectCompanyByUid(tender.getUserid());
		System.out.println(company);
		tender.setCompanyid(company.getCompanyid());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		tender.setFinishtime(sdf.format(new Date()));
		tender.setCheckid(1);
		tender.setIsdelete(0);
		tender.setState(0);
		System.out.println(tender);
		map.put("row",tenderService.insert(tender));
		return map;
	}
	
	@RequestMapping("/loadTenderFront")			//前台回显
	@ResponseBody
	public Map loadTenderFront(Long tenderid){
		Map<String, Tender> map = new HashMap<String,Tender>();
		map.put("tender",tenderService.selectByPrimaryKey(tenderid));
		return map;
	}
	
	@RequestMapping("/updateTenderFront")			//前台修改投标申请
	@ResponseBody
	public Map updateTenderFront(Tender tender){
		Map<String, Integer> map = new HashMap<String,Integer>();
		map.put("row",tenderService.updateByPrimaryKeySelective(tender));
		return map;
	}
	
	@RequestMapping("/softDelTenderFront")      //前台软删除
	@ResponseBody
	public Map softDelTenderFront(Long tenderid){
		Map map = new HashMap();
		Tender tender = tenderService.selectByPrimaryKey(tenderid);
		tender.setIsdelete(1);
		map.put("row", tenderService.updateByPrimaryKeySelective(tender));
		return map;
	}
	
}
