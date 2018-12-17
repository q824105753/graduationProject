package com.qy.service;

import java.util.List;

import com.qy.pojo.Car;

import cn.itcast.common.page.Pagination;

public interface CarService {

	int deleteByPrimaryKey(Integer cid);

    int insert(Car record);

    Car selectByPrimaryKey(Integer cid);

    int updateByPrimaryKeySelective(Car record);
    //查询没有被删除的车辆
    List<Car> selectAllCar();
    //查询删除的车辆
    List<Car> selectDelCar();
    //前台查询所有未被删除的车辆
    Pagination frontCarList(Car record, int pageNo);
    //传已租赁但是未归还的车辆
    List<Car> selectByUserId(Integer uid);
}
