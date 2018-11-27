package com.hxx.drug.controller;

import com.hxx.drug.bean.Business;
import com.hxx.drug.bean.Category;
import com.hxx.drug.dao.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

/**
 * @Description
 * @auther qiyong
 * @create 2018-11-23 15:56
 */
@Controller
public class CategoryController {

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

    @RequestMapping("/categoryDelList")
    public ModelAndView categoryDelList() {
        ModelAndView mav = new ModelAndView("category-del","page",categoryMapper.selectAllDel());
        return mav;
    }

    @RequestMapping("/toCategoryAdd")
    public ModelAndView toCategoryAdd() {
        ModelAndView mav = new ModelAndView("category-add");
        return mav;
    }

    @RequestMapping("/categoryList")
    public ModelAndView categoryList() {
        ModelAndView mav = new ModelAndView("category","page",categoryMapper.selectAll());
        return mav;
    }

    @RequestMapping("/selectCategoryById")
    public ModelAndView selectCategoryById(Integer cid) {
        ModelAndView mav = new ModelAndView("category-update");
        mav.addObject("category",categoryMapper.selectByPrimaryKey(cid));
        return mav;
    }

    @RequestMapping("/insertCategory")
    @ResponseBody
    public Map insertCategory(Category category) {
        Map map = new HashMap();
        category.setIsDel(0);
        map.put("result",categoryMapper.insertSelective(category));
        return map;
    }

    @RequestMapping("/delCategory")
    @ResponseBody
    public Map delCategory(Integer cid) {
        Map map = new HashMap();
        map.put("result",categoryMapper.deleteByPrimaryKey(cid));
        return map;
    }

    @RequestMapping("/softDelCategory")
    @ResponseBody
    public Map softDelCategory(Integer cid) {
        Map map = new HashMap();
        Category category  = categoryMapper.selectByPrimaryKey(cid);
        category.setIsDel(1);
        map.put("result",categoryMapper.updateByPrimaryKeySelective(category));
        return map;
    }

    @RequestMapping("/resetDelCategory")
    @ResponseBody
    public Map resetDelCategory(Integer cid) {
        Map map = new HashMap();
        Category category  = categoryMapper.selectByPrimaryKey(cid);
        category.setIsDel(0);
        map.put("result",categoryMapper.updateByPrimaryKeySelective(category));
        return map;
    }

    @RequestMapping("/updateCategory")
    public ModelAndView updateCategory(Category category) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("result",categoryMapper.updateByPrimaryKeySelective(category));
        return mav;
    }

}
