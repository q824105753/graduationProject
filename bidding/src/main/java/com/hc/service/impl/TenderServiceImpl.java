package com.hc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hc.dao.TenderMapper;
import com.hc.pojo.Company;
import com.hc.pojo.Tender;
import com.hc.service.TenderService;

import cn.itcast.common.page.Pagination;
@Service("tenderService")
@Transactional
public class TenderServiceImpl implements TenderService{
	
	@Autowired
	private TenderMapper tenderMapper;
	
	//查询
    public List<Tender> selectAllTender(){
    	return tenderMapper.selectAllTender();
    }
    //分页查询
    public Pagination selectAllTenderByPage(Tender record, int pageNo) {
    	record.setCurrentPage((pageNo-1)*record.getSize());
		List<Tender> tlist = tenderMapper.selectAllTenderByPage(record);
		
		Pagination page = new Pagination(pageNo,record.getSize(),tenderMapper.selectTenderCount(record));
		StringBuilder params = new StringBuilder();
		params.append("size="+record.getSize());
		if(record.getTendername()!=null) {
			params.append("&tendername="+record.getTendername());
		}
		String url = "bidding/admin/selectAllTenderByPage";
		page.setList(tlist);
		page.pageView(url, params.toString());
		return page;
	}

	public int deleteByPrimaryKey(Long tenderid) {
		return tenderMapper.deleteByPrimaryKey(tenderid);
	}

	public int insert(Tender record) {
		return tenderMapper.insert(record);
	}

	public Tender selectByPrimaryKey(Long tenderid) {
		return tenderMapper.selectByPrimaryKey(tenderid);
	}

	public int updateByPrimaryKeySelective(Tender record) {
		return tenderMapper.updateByPrimaryKeySelective(record);
	}
	//软删除
	public List<Tender> softDeleteTender() {
		return tenderMapper.softDeleteTender();
	}
	public int selectTenderCount(Tender record) {
		
		return tenderMapper.selectTenderCount(record);
	}
	public Pagination selectAllByState(Tender record, int pageNo) {
		record.setCurrentPage((pageNo-1)*record.getSize());
		List<Tender> tlist = tenderMapper.selectAllByState(record);
		
		Pagination page = new Pagination(pageNo,record.getSize(),tenderMapper.selectAllCountByState(record));
		StringBuilder params = new StringBuilder();
		params.append("size="+record.getSize());
		String url = "/bidding/selectAllByState";
		page.setList(tlist);
		page.pageView(url, params.toString());
		return page;
	}
	public Pagination selectAllTenderFront(Tender record, int pageNo) {
		record.setCurrentPage((pageNo-1)*record.getSize());
		List<Tender> tlist = tenderMapper.selectAllTenderFront(record);
		
		Pagination page = new Pagination(pageNo,record.getSize(),tenderMapper.selectAllTenderFrontCount(record));
		StringBuilder params = new StringBuilder();
		params.append("size="+record.getSize());
		String url = "/bidding/selectAllTenderFront";
		page.setList(tlist);
		page.pageView(url, params.toString());
		return page;
	}
	public List<Tender> selectAllTenderByState() {
		return tenderMapper.selectAllTenderByState();
	}
	



	
}
