package com.hc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hc.dao.CompactMapper;
import com.hc.dao.CompanyMapper;
import com.hc.pojo.Company;
import com.hc.service.CompanyService;

import cn.itcast.common.page.Pagination;
@Service("companyService")
@Transactional
public class CompanyServiceImpl implements CompanyService {
	
	@Autowired
	private CompanyMapper companyMapper;

	public int deleteByPrimaryKey(Long companyid) {
		
		return companyMapper.deleteByPrimaryKey(companyid);
	}

	public int insert(Company record) {
		// TODO Auto-generated method stub
		return companyMapper.insert(record);
	}

	public int insertSelective(Company record) {
		// TODO Auto-generated method stub
		return companyMapper.insertSelective(record);
	}

	public Company selectByPrimaryKey(Long companyid) {
		// TODO Auto-generated method stub
		return companyMapper.selectByPrimaryKey(companyid);
	}

	public int updateByPrimaryKeySelective(Company record) {
		// TODO Auto-generated method stub
		return companyMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Company record) {
		// TODO Auto-generated method stub
		return companyMapper.updateByPrimaryKey(record);
	}

	public Pagination selectAllCompanyByPage(Company record, int pageNo) {
		record.setCurrentPage((pageNo-1)*record.getSize());
		List<Company> clist = companyMapper.selectAllCompanyByPage(record);
		
		Pagination page = new Pagination(pageNo,record.getSize(),companyMapper.selectCompanyCount(record));
		StringBuilder params = new StringBuilder();
		params.append("size="+record.getSize());
		if(record.getCompanyname()!=null) {
			params.append("&companyname="+record.getCompanyname());
		}
		String url = "bidding/admin/selectAllCompanyByPage";
		page.setList(clist);
		page.pageView(url, params.toString());
		return page;
	}

	public List<Company> selectAllCompany() {
		// TODO Auto-generated method stub
		return companyMapper.selectAllCompany();
	}

	public int selectCompanyCount(Company record) {
		// TODO Auto-generated method stub
		return companyMapper.selectCompanyCount(record);
	}

	public Company selectCompanyByUid(Long userid) {
		return companyMapper.selectCompanyByUid(userid);
	}


	

}
