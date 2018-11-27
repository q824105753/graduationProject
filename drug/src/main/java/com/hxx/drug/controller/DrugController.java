package com.hxx.drug.controller;

import cn.itcast.common.page.Pagination;
import com.hxx.drug.bean.Business;
import com.hxx.drug.bean.Drug;
import com.hxx.drug.dao.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Description
 * @auther qiyong
 * @create 2018-11-23 15:56
 */
@Controller
public class DrugController {

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

    @RequestMapping("/drugDelList")
    public ModelAndView drugDelList() {
        List<Drug> drugList = drugMapper.selectAllDel();
        for(Drug drug1:drugList){
            drug1.setBusiness(businessMapper.selectByPrimaryKey(drug1.getBid()));
            drug1.setCategory(categoryMapper.selectByPrimaryKey(drug1.getCid()));
        }
        ModelAndView mav = new ModelAndView("drug-del", "page", drugList);
        return mav;
    }

    @RequestMapping("/toDrugUpdate")
    public ModelAndView toDrugUpdate(Integer did) {
        ModelAndView mav = new ModelAndView("drug-update", "blist",businessMapper.selectAllNoParame());
        mav.addObject("clist", categoryMapper.selectAll());
        mav.addObject("drug", drugMapper.selectByPrimaryKey(did));
        return mav;
    }

    @RequestMapping("/toDrugAdd")
    public ModelAndView toDrugAdd() {
        ModelAndView mav = new ModelAndView("drug-add", "blist",businessMapper.selectAllNoParame());
        mav.addObject("clist", categoryMapper.selectAll());
        return mav;
    }

    @RequestMapping("/drugList")
    public ModelAndView toDrug(Drug drug, Integer pageNo) {
        if (drug.getSize() == null) {
            drug.setSize(6);
        }
        if (pageNo == null) {
            pageNo = 1;
        }
        if(drug.getDname()!=null&&"".equals(drug.getDname())){
            drug.setDname(null);
        }
        if(drug.getCid()!=null&&"".equals(drug.getCid())){
            drug.setCid(null);
        }
        ModelAndView mav = new ModelAndView("drug", "page", findAllDrug(drug, pageNo));
        mav.addObject("clist", categoryMapper.selectAll());
        return mav;
    }

    @RequestMapping("/selectDrugById")
    public ModelAndView selectDrugById(Integer did) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("drug",drugMapper.selectByPrimaryKey(did));
        return mav;
    }

    @RequestMapping("/insertDrug")
    @ResponseBody
    public Map insertDrug(Drug drug) {
        drug.setIsDel(0);
        Map map = new HashMap();
        map.put("result",drugMapper.insertSelective(drug));
        return map;
    }

    @RequestMapping("/softDelDrug")
    @ResponseBody
    public Map softDelDrug(Integer did) {
        Map map = new HashMap();
        Drug drug  = drugMapper.selectByPrimaryKey(did);
        drug.setIsDel(1);
        map.put("result",drugMapper.updateByPrimaryKeySelective(drug));
        return map;
    }

    @RequestMapping("/delDrug")
    @ResponseBody
    public Map delDrug(Integer did) {
        Map map = new HashMap();
        map.put("result",drugMapper.deleteByPrimaryKey(did));
        return map;
    }

    @RequestMapping("/resetDelDrug")
    @ResponseBody
    public Map resetDelDrug(Integer did) {
        Map map = new HashMap();
        Drug drug  = drugMapper.selectByPrimaryKey(did);
        drug.setIsDel(0);
        map.put("result",drugMapper.updateByPrimaryKeySelective(drug));
        return map;
    }

    @RequestMapping("/updateDrug")
    @ResponseBody
    public Map updateDrug(Drug drug) {
        Map map = new HashMap();
        map.put("result",drugMapper.updateByPrimaryKeySelective(drug));
        return map;
    }
    Pagination findAllDrug(Drug drug, Integer pageNo){
        drug.setCurrentPage((pageNo-1)*drug.getSize());
        List<Drug> dlist = drugMapper.selectAll(drug);
        for(Drug drug1:dlist){
            drug1.setBusiness(businessMapper.selectByPrimaryKey(drug1.getBid()));
            drug1.setCategory(categoryMapper.selectByPrimaryKey(drug1.getCid()));
        }
        Pagination page = new Pagination(pageNo,drug.getSize(),drugMapper.selectCount(drug));
        StringBuilder params = new StringBuilder();
        params.append("size=" + drug.getSize());
        if(drug.getDname()!=null){
            params.append("&dname=" + drug.getDname());
        }
        if(drug.getCid()!=null){
            params.append("&cid=" + drug.getCid());
        }
        String url = "/drugList";
        page.setList(dlist);
        page.pageView(url, params.toString());
        return page;
    }

}
