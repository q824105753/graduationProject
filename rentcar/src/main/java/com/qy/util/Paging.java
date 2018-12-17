package com.qy.util;

import java.io.Serializable;
import java.util.List;

/**
 * <b>分页类</b>
 * <p>
 * 将一组数据根据每页记录长度进行分段，设置显示页数，可以返回相应页的数据。
 * <p>
 * 提供向前翻，向后翻，返回第一页，跳到最后一页的方法。
 * 
 * @author 824105753
 *
 * @param <T>
 *            页面要显示的pojo类型
 */
public class Paging<T> implements Serializable {

	private static final long serialVersionUID = 7679002691681537059L;

	private int pageSize;// 每页显示多少条记录

	private int currentPage;// 当前第几页

	private int totalRecord;// 一共多少条记录

	private int totalPage;// 一共多少页

	private List<T> dataList;// 所有要显示的数据

	/**
	 * 根据<b>待分页数据列表</b>和<b>每页显示的记录数</b>，构建一个分页对象。
	 * 
	 * @param pageSize
	 *            每页显示记录数
	 * @param sourceList
	 *            待分页数据列表
	 */
	public Paging(int pageSize, List<T> sourceList) {
		super();
		if (sourceList == null) {
			return;
		}
		// 总记录条数
		this.totalRecord = sourceList.size();
		// 每页显示多少条记录
		this.pageSize = pageSize;
		// 获取总页数
		this.totalPage = this.totalRecord / this.pageSize;
		if (this.totalRecord % this.pageSize != 0) {
			this.totalPage = this.totalPage + 1;
		}
		// 设置当前显示为第一页
		this.currentPage = 1;
		this.dataList = sourceList;
	}

	/**
	 * 根据<b>待分页数据列表</b>，构建一个分页对象，默认每页显示10条记录。
	 * 
	 * @param sourceList
	 *            待分页数据列表
	 */
	public Paging(List<T> sourceList) {
		this(10, sourceList);
	}

	/**
	 * 向后翻页
	 */
	public void toNext() {
		setCurrentPage(currentPage + 1);
	}

	/**
	 * 向回（前）翻页
	 */
	public void toBack() {
		setCurrentPage(currentPage - 1);
	}

	/**
	 * 翻到第一页
	 */
	public void toFirst() {
		setCurrentPage(1);
	}

	/**
	 * 翻到最后一页
	 */
	public void toLast() {
		setCurrentPage(totalPage);
	}

	/**
	 * 获取每页显示的记录的个数
	 * 
	 * @return 每页显示记录数
	 */
	public int getPageSize() {
		return pageSize;
	}

	/**
	 * 设置每页要显示记录的个数
	 * 
	 * @param pageSize
	 */
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	/**
	 * 返回当前要显示的页数
	 * 
	 * @return 要显示的页数
	 */
	public int getCurrentPage() {
		return currentPage;
	}

	/**
	 * 修改当前要显示的页数，如果过大，则显示最后一页，如果过小，则显示第一页。
	 * 
	 * @param currentPage
	 *            要显示的页数
	 */
	public void setCurrentPage(int currentPage) {
		if (currentPage <= 0) {
			this.currentPage = 1;
		} else if (this.totalPage < currentPage) {
			this.currentPage = this.totalPage;
		} else {
			this.currentPage = currentPage;
		}
	}

	/**
	 * 获取当前要显示已分页的数据
	 * 
	 * @return 当前页显示的数据
	 */
	public List<T> getDataList() {
		// 起始索引
		int fromIndex = this.pageSize * (this.currentPage - 1);
		// 结束索引
		int toIndex = this.pageSize * this.currentPage > this.totalRecord ? this.totalRecord
				: this.pageSize * this.currentPage;
		return dataList.subList(fromIndex, toIndex);
	}

	/**
	 * 获取原始数据列表
	 * 
	 * @return 原始数据列表
	 */
	public List<T> getSourceDataList() {
		return dataList;
	}

	/**
	 * 获取当前数据列表的总记录数
	 * 
	 * @return 总记录数
	 */
	public int getTotalRecord() {
		return totalRecord;
	}

	/**
	 * 根据每页显示记录数分页，返回分得的页数。
	 * 
	 * @return 总页数
	 */
	public int getTotalPage() {
		return totalPage;
	}

	/**
	 * 得到当前页数的数据
	 * 
	 */
	public Paging(int pageSize, int currentPage, List<T> sourceList) {
		super();
		if (sourceList == null) {
			return;
		}
		// 总记录条数
		this.totalRecord = sourceList.size();
		// 每页显示多少条记录
		this.pageSize = pageSize;
		// 获取总页数
		this.totalPage = this.totalRecord / this.pageSize;
		if (this.totalRecord % this.pageSize != 0) {
			this.totalPage = this.totalPage + 1;
		}
		// 设置当前显示为第一页
		this.currentPage = currentPage;
		this.dataList = sourceList;
	}

}
