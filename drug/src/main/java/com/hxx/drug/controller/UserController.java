package com.hxx.drug.controller;

import com.hxx.drug.bean.User;
import com.hxx.drug.dao.*;
import com.hxx.drug.util.Tool;
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

    @RequestMapping("/toUserAdd")
    public ModelAndView toUserAdd() {
        ModelAndView mav = new ModelAndView("user-add");
        return mav;
    }

    @RequestMapping("/userList")
    public ModelAndView selectAllUser() {
        ModelAndView mav = new ModelAndView("user","page",userMapper.selectAll());
        return mav;
    }

    @RequestMapping("/selectUserById")
    public ModelAndView selectUserById(Integer uid) {
        ModelAndView mav = new ModelAndView("user-update");
        mav.addObject("user",userMapper.selectByPrimaryKey(uid));
        return mav;
    }

    @RequestMapping("/insertUser")
    @ResponseBody
    public Map insertUser(User user) {
        user.setIsDel(0);
        Map map = new HashMap();
        user.setUpwd(Tool.encodePassword(user.getUpwd()));
        map.put("result",userMapper.insertSelective(user));
        return map;
    }

    @RequestMapping("/softDelUser")
    @ResponseBody
    public Map softDelUser(Integer uid) {
        Map map = new HashMap();
        User user  = userMapper.selectByPrimaryKey(uid);
        user.setIsDel(1);
        map.put("result",userMapper.updateByPrimaryKeySelective(user));
        return map;
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
    @ResponseBody
    public Map updateUser(User user) {
        Map map = new HashMap();
        map.put("result",userMapper.updateByPrimaryKeySelective(user));
        return map;
    }

}
