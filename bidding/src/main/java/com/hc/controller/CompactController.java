package com.hc.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hc.pojo.Compact;
import com.hc.pojo.Notice;
import com.hc.pojo.Tender;
import com.hc.pojo.User;
import com.hc.service.CompactService;
import com.hc.service.CompanyService;
import com.hc.service.NoticeService;
import com.hc.service.TenderService;
import com.sun.org.apache.xerces.internal.util.SynchronizedSymbolTable;

@Controller
public class CompactController {
	
	@Autowired
	private CompanyService companyService;
	@Autowired
	private CompactService compactService;
	@Autowired
	private TenderService tenderService;
	@Autowired
	private NoticeService noticeService;

	@RequestMapping("/compact")
	@ResponseBody
	public Map compact(Long tenderid,HttpSession session) {
		Tender tender = tenderService.selectByPrimaryKey(tenderid);
		Notice notice = noticeService.selectByPrimaryKey(tender.getBidid());
		
		Map map = new HashMap();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		Calendar c = Calendar.getInstance();
		c.add(Calendar.DATE, 90);//计算90天后的时间
		String stoptime=sdf.format(c.getTime());
		map.put("bidCompanyName", companyService.selectByPrimaryKey(tender.getCompanyid()).getCompanyname());
		map.put("tenderCompanyName",companyService.selectByPrimaryKey(notice.getCompanyid()).getCompanyname());
		map.put("itemName", notice.getItemname());
		map.put("detail1", notice.getDetail());
		map.put("creattime", sdf.format(new Date()));
		map.put("starttime", sdf.format(new Date()));
		map.put("stoptime", stoptime);
		map.put("tenderid", tenderid);
		User user = (User)session.getAttribute("user");
		map.put("username", user.getName());
		return map;
	}
	
	@RequestMapping("/insertCompact")
	@ResponseBody
	public Map insertCompact(Compact compact) {
		Tender tender = tenderService.selectByPrimaryKey(compact.getTenderid());
		System.out.println(compact.getTenderid());
		tender.setState(1);
		tenderService.updateByPrimaryKeySelective(tender);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		Calendar c = Calendar.getInstance();
		c.add(Calendar.DATE, 90);//计算90天后的时间
		String stoptime=sdf.format(c.getTime());
		Map map = new HashMap();
		compact.setStarttime(sdf.format(new Date()));
		compact.setStoptime(stoptime);
		compact.setMoney(500000.0);
		compact.setState(0);
		compact.setCreatetime(sdf.format(new Date()));
		compact.setMessage("合作愉快");
		map.put("row", compactService.insert(compact));
		return map;
	}
	
	@RequestMapping("/loadCompact")
	@ResponseBody
	public Map compact(Long tenderid) {
		
		System.out.println("      tenderid    "+tenderid);
		
		Compact compact = compactService.selectByTenderid(tenderid);
		Tender tender = tenderService.selectByPrimaryKey(tenderid);
		
		System.out.println("      bidid    "+tender.getBidid());
		
		Notice notice = noticeService.selectByPrimaryKey(tender.getBidid());
		
		System.out.println("      tcompanyid    "+tender.getCompanyid());
		System.out.println("      zcompanyid    "+notice.getCompanyid());
		
		Map map = new HashMap();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		Calendar c = Calendar.getInstance();
		c.add(Calendar.DATE, 90);//计算90天后的时间
		String stoptime=sdf.format(c.getTime());
		map.put("bidCompanyName", companyService.selectByPrimaryKey(tender.getCompanyid()).getCompanyname());
		map.put("tenderCompanyName",companyService.selectByPrimaryKey(notice.getCompanyid()).getCompanyname());
		map.put("itemName", notice.getItemname());
		map.put("detail1", notice.getDetail());
		map.put("creattime", compact.getCreatetime());
		map.put("starttime", compact.getStarttime());
		map.put("stoptime", compact.getStoptime());
		map.put("money", compact.getMoney());
		map.put("tenderid", tenderid);
		return map;
	}
	
	
}
