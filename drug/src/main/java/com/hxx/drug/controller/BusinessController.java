package com.hxx.drug.controller;

import cn.itcast.common.page.Pagination;
import com.hxx.drug.bean.Business;
import com.hxx.drug.bean.Drug;
import com.hxx.drug.dao.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @RequestMapping("/businessDelList")
    public ModelAndView businessDelList(Business business) {
        ModelAndView mav = new ModelAndView("business-del","page",businessMapper.selectAllDel());
        return mav;
    }

    @RequestMapping("/toBusinessAdd")
    public ModelAndView toBusinessAdd() {
        ModelAndView mav = new ModelAndView("business-add");
        return mav;
    }

    @RequestMapping("/businessList")
    public ModelAndView businessList(Business business, Integer pageNo) {
        if (business.getSize() == null) {
            business.setSize(6);
        }
        if (pageNo == null) {
            pageNo = 1;
        }
        ModelAndView mav = new ModelAndView("business","page", findAllBusiness(business, pageNo));
        return mav;
    }

    @RequestMapping("/selectBusinessById")
    public ModelAndView selectBusinessById(Integer bid) {
        ModelAndView mav = new ModelAndView("business-update","business",businessMapper.selectByPrimaryKey(bid));
        return mav;
    }

    @RequestMapping("/insertBusiness")
    @ResponseBody
    public Map insertBusiness(Business business) {
        Map map = new HashMap();
        business.setIsDel(0);
        map.put("result",businessMapper.insertSelective(business));
        return map;
    }

    @RequestMapping("/delBusiness")
    @ResponseBody
    public Map delBusiness(Integer bid) {
        Map map = new HashMap();
        map.put("result",businessMapper.deleteByPrimaryKey(bid));
        return map;
    }

    @RequestMapping("/softDelBusiness")
    @ResponseBody
    public Map softDelBusiness(Integer bid) {
        Map map = new HashMap();
        Business business  = businessMapper.selectByPrimaryKey(bid);
        business.setIsDel(1);
        map.put("result",businessMapper.updateByPrimaryKeySelective(business));
        return map;
    }

    @RequestMapping("/resetDelBusiness")
    @ResponseBody
    public Map resetDelBusiness(Integer bid) {
        Map map = new HashMap();
        Business business  = businessMapper.selectByPrimaryKey(bid);
        business.setIsDel(0);
        map.put("result",businessMapper.updateByPrimaryKeySelective(business));
        return map;
    }

    @RequestMapping("/updateBusiness")
    @ResponseBody
    public Map updateBusiness(Business business) {
        Map map = new HashMap();
        map.put("result",businessMapper.updateByPrimaryKeySelective(business));
        return map;
    }

    Pagination findAllBusiness(Business business, Integer pageNo){
        business.setCurrentPage((pageNo-1)*business.getSize());
        List<Business> blist = businessMapper.selectAll(business);
        Pagination page = new Pagination(pageNo,business.getSize(),businessMapper.selectCount(business));
        StringBuilder params = new StringBuilder();
        params.append("size=" + business.getSize());
        String url = "/businessList";
        page.setList(blist);
        page.pageView(url, params.toString());
        return page;
    }

}
