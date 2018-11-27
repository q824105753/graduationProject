package com.hxx.drug.controller;

import com.hxx.drug.bean.Business;
import com.hxx.drug.bean.Category;
import com.hxx.drug.dao.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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

    @RequestMapping("/categoryList")
    public String categoryList(Category category, Integer pageNo) {

        return "category";
    }

    @RequestMapping("/selectAllCategory")
    public ModelAndView selectAllCategory(Category category, Integer pageNo) {
        ModelAndView mav = new ModelAndView();
        return mav;
    }

    @RequestMapping("/selectCategoryById")
    public ModelAndView selectCategoryById(Integer cid) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("category",categoryMapper.selectByPrimaryKey(cid));
        return mav;
    }

    @RequestMapping("/insertCategory")
    public ModelAndView insertCategory(Category category) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("result",categoryMapper.insertSelective(category));
        return mav;
    }

    @RequestMapping("/softDelCategory")
    public ModelAndView softDelCategory(Integer cid) {
        ModelAndView mav = new ModelAndView();
        Category category  = categoryMapper.selectByPrimaryKey(cid);
        category.setIsDel(1);
        mav.addObject("result",categoryMapper.updateByPrimaryKeySelective(category));
        return mav;
    }

    @RequestMapping("/resetDelCategory")
    public ModelAndView resetDelCategory(Integer cid) {
        ModelAndView mav = new ModelAndView();
        Category category  = categoryMapper.selectByPrimaryKey(cid);
        category.setIsDel(0);
        mav.addObject("result",categoryMapper.updateByPrimaryKeySelective(category));
        return mav;
    }

    @RequestMapping("/updateCategory")
    public ModelAndView updateCategory(Category category) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("result",categoryMapper.updateByPrimaryKeySelective(category));
        return mav;
    }

}
