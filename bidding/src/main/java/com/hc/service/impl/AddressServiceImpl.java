package com.hc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hc.dao.AddressMapper;
import com.hc.dao.AreaMapper;
import com.hc.dao.CityMapper;
import com.hc.dao.ProvinceMapper;
import com.hc.pojo.Address;
import com.hc.pojo.Province;
import com.hc.service.AddressService;

@Service("addressService")
@Transactional
public class AddressServiceImpl implements AddressService{
	@Autowired
	private AddressMapper addressMapper;

	public Address selectByPrimaryKey(Long addressid) {
		return addressMapper.selectByPrimaryKey(addressid);
	}

	public int deleteByPrimaryKey(Long addressid) {
		return 0;
	}

	public int insert(Address record) {
		addressMapper.insert(record);
		String str = record.getAddressid().toString();
		return Integer.parseInt(str);
	}

	public int updateByPrimaryKeySelective(Address record) {
		return addressMapper.updateByPrimaryKeySelective(record);
	}


	
	
	
	
}
