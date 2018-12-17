package com.qy.serviceimpl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qy.mapper.CarMapper;
import com.qy.pojo.Car;
import com.qy.service.CarService;

import cn.itcast.common.page.Pagination;
@Service("carService")
@Transactional
public class CarServiceImpl implements CarService {

	@Autowired
	private CarMapper carMapper;
	
	public int deleteByPrimaryKey(Integer cid) {
		
		return carMapper.deleteByPrimaryKey(cid);
	}

	public int insert(Car record) {
		return carMapper.insert(record);
	}


	public Car selectByPrimaryKey(Integer cid) {
		return carMapper.selectByPrimaryKey(cid);
	}

	public int updateByPrimaryKeySelective(Car record) {
		return carMapper.updateByPrimaryKeySelective(record);
	}

	public List<Car> selectAllCar() {
		List<Car> clist = carMapper.selectAllCar();
		return clist;
	}

	public List<Car> selectDelCar() {
		return carMapper.selectDelCar();
	}

	 //前台查询所有未被删除的车辆
	public Pagination frontCarList(Car record, int pageNo) {
		record.setCurrentPage((pageNo - 1) * record.getSize());
		List<Car> clist = carMapper.frontCarList(record);
		Pagination page = new Pagination(pageNo, record.getSize(), carMapper.selectCarCount(record));
		StringBuilder params = new StringBuilder();
		params.append("size=" + record.getSize());
		
		if(record.getCname()!=null){
			params.append("&cname=" + record.getCname());
		}
		if(record.getC1id()!=null){
			params.append("&c1id=" + record.getC1id());
		}
		if(record.getC2id()!=null){
			params.append("&c2id=" + record.getC2id());
		}
		String url = "frontCarList";
		page.setList(clist);
		page.pageView(url, params.toString());
		return page;
	}

	public List<Car> selectByUserId(Integer uid) {
		return carMapper.selectByUserId(uid);
	}

}
