package com.hc.service;

import java.util.List;

import com.hc.pojo.Company;

import cn.itcast.common.page.Pagination;

public interface CompanyService {
	int deleteByPrimaryKey(Long companyid);

	int insert(Company record);

	int insertSelective(Company record);

	Company selectByPrimaryKey(Long companyid);

	int updateByPrimaryKeySelective(Company record);

	int updateByPrimaryKey(Company record);
	//分页查询
	Pagination selectAllCompanyByPage(Company record,int pageNo);
	
	int selectCompanyCount(Company record);
	
	List<Company> selectAllCompany();

	Company selectCompanyByUid(Long userid);
}
