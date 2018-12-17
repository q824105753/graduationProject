package com.hc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hc.dao.NoticeMapper;
import com.hc.pojo.Company;
import com.hc.pojo.Notice;
import com.hc.service.NoticeService;

import cn.itcast.common.page.Pagination;
@Service("noticeService")
@Transactional
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeMapper noticeMapper;

	public int deleteByPrimaryKey(Long noticeid) {
		return noticeMapper.deleteByPrimaryKey(noticeid);
	}

	public int insert(Notice record) {
		return noticeMapper.insert(record);
	}


	public Notice selectByPrimaryKey(Long noticeid) {
		return noticeMapper.selectByPrimaryKey(noticeid);
	}

	public int updateByPrimaryKeySelective(Notice noticeid) {
		return noticeMapper.updateByPrimaryKeySelective(noticeid);
	}

	public List<Notice> selectByNoticeDel() {
		return noticeMapper.selectByNoticeDel();
	}

	public List<Notice> selectAllNotice() {
		// TODO Auto-generated method stub
		return noticeMapper.selectAllNotice();
	}
	//分页查询
	public Pagination selectAllNoticeByPage(Notice record, int pageNo) {
		record.setCurrentPage((pageNo-1)*record.getSize());
		List<Notice> nlist = noticeMapper.selectAllNoticeByPage(record);
		
		Pagination page = new Pagination(pageNo,record.getSize(),noticeMapper.selectNoticeCount(record));
		StringBuilder params = new StringBuilder();
		params.append("size="+record.getSize());
		if(record.getItemname()!=null) {
			params.append("&itemName="+record.getItemname());
		}
		String url = "bidding/admin/selectAllNoticeByPage";
		page.setList(nlist);
		page.pageView(url, params.toString());
		return page;
	}

	public int selectNoticeCount(Notice record) {
		return noticeMapper.selectNoticeCount(record);
	}

	public Pagination selectAllNoticeFront(Notice record, int pageNo) {
		record.setCurrentPage((pageNo-1)*record.getSize());
		List<Notice> nlist = noticeMapper.selectAllNoticeByPage(record);
		
		Pagination page = new Pagination(pageNo,record.getSize(),noticeMapper.selectNoticeCount(record));
		StringBuilder params = new StringBuilder();
		params.append("size="+record.getSize());
		String url = "bidding/selectAllNoticeFront";
		page.setList(nlist);
		page.pageView(url, params.toString());
		return page;
	}

}
