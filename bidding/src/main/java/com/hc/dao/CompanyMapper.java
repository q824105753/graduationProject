package com.hc.dao;

import java.util.List;

import com.hc.pojo.Company;

public interface CompanyMapper {
    int deleteByPrimaryKey(Long companyid);

    int insert(Company record);

    int insertSelective(Company record);

    Company selectByPrimaryKey(Long companyid);

    int updateByPrimaryKeySelective(Company record);

    int updateByPrimaryKey(Company record);

	List<Company> selectAllCompany();
	//分页查询
	List<Company> selectAllCompanyByPage(Company record);
	//
	int selectCompanyCount(Company record);
	
	Company selectCompanyByUid(Long userid);
}