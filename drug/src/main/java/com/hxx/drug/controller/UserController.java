package com.hxx.drug.controller;

import com.hxx.drug.bean.User;
import com.hxx.drug.dao.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @Description
 * @auther qiyong
 * @create 2018-11-23 15:57
 */
@Controller
public class UserController {

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

    @RequestMapping("/selectAllUser")
    public ModelAndView selectAllUser(User user, Integer pageNo) {
        ModelAndView mav = new ModelAndView();
        return mav;
    }

    @RequestMapping("/selectUserById")
    public ModelAndView selectUserById(Integer uid) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("user",userMapper.selectByPrimaryKey(uid));
        return mav;
    }

    @RequestMapping("/insertUser")
    public ModelAndView insertUser(User user) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("result",userMapper.insertSelective(user));
        return mav;
    }

    @RequestMapping("/softDelUser")
    public ModelAndView softDelUser(Integer uid) {
        ModelAndView mav = new ModelAndView();
        User user  = userMapper.selectByPrimaryKey(uid);
        user.setIsDel(1);
        mav.addObject("result",userMapper.updateByPrimaryKeySelective(user));
        return mav;
    }

    @RequestMapping("/resetDelUser")
    public ModelAndView resetDelUser(Integer uid) {
        ModelAndView mav = new ModelAndView();
        User user  = userMapper.selectByPrimaryKey(uid);
        user.setIsDel(0);
        mav.addObject("result",userMapper.updateByPrimaryKeySelective(user));
        return mav;
    }

    @RequestMapping("/updateUser")
    public ModelAndView updateUser(User user) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("result",userMapper.updateByPrimaryKeySelective(user));
        return mav;
    }

}
