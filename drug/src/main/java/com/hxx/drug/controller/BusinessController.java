package com.hxx.drug.controller;

import com.hxx.drug.bean.Business;
import com.hxx.drug.dao.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @Description
 * @auther qiyong
 * @create 2018-11-23 15:55
 */
@RestController
public class BusinessController {

    @Autowired
    private BusinessMapper businessMapper;
    @Autowired
    private CategoryMapper categoryMapper;
    @Autowired
    private DrugMapper drugMapper;
    @Autowired
    private StockMapper stockMapper;
    @Autowired
    private UserMapper userMapper;

    @RequestMapping("/selectAllBusiness")
    public List selectAll(Business business, Integer pageNo) {
        return businessMapper.selectAll();
    }

    @RequestMapping("/selectBusinessById")
    public ModelAndView selectBusinessById(Integer bid) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("business",businessMapper.selectByPrimaryKey(bid));
        return mav;
    }

    @RequestMapping("/insertBusiness")
    public ModelAndView insertBusiness(Business business) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("result",businessMapper.insertSelective(business));
        return mav;
    }

    @RequestMapping("/softDelBusiness")
    public ModelAndView softDelBusiness(Integer bid) {
        ModelAndView mav = new ModelAndView();
        Business business  = businessMapper.selectByPrimaryKey(bid);
        business.setIsDel(1);
        mav.addObject("result",businessMapper.updateByPrimaryKeySelective(business));
        return mav;
    }

    @RequestMapping("/resetDelBusiness")
    public ModelAndView resetDelBusiness(Integer bid) {
        ModelAndView mav = new ModelAndView();
        Business business  = businessMapper.selectByPrimaryKey(bid);
        business.setIsDel(0);
        mav.addObject("result",businessMapper.updateByPrimaryKeySelective(business));
        return mav;
    }

    @RequestMapping("/updateBusiness")
    public ModelAndView updateBusiness(Business business) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("result",businessMapper.updateByPrimaryKeySelective(business));
        return mav;
    }

}
