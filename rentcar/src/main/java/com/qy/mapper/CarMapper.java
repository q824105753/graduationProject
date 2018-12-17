package com.qy.mapper;

import java.util.List;

import com.qy.pojo.Car;

public interface CarMapper {
    int deleteByPrimaryKey(Integer cid);

    int insert(Car record);

    int insertSelective(Car record);

    Car selectByPrimaryKey(Integer cid);

    int updateByPrimaryKeySelective(Car record);

    int updateByPrimaryKey(Car record);
    //查询没有被删除的车辆
    List<Car> selectAllCar();
    //查询删除的车辆
    List<Car> selectDelCar();
    //前台查询所有未被删除的车辆
    List<Car> frontCarList(Car record);
    //查询总车辆数
    int selectCarCount(Car record);
    //传已租赁但是未归还的车辆
    List<Car> selectByUserId(Integer uid);
 }