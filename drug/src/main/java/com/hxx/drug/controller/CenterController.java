package com.hxx.drug.controller;

import com.hxx.drug.bean.User;
import com.hxx.drug.dao.*;
import net.bytebuddy.asm.Advice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 824105753 on 2018/11/24.
 */
@Controller
public class CenterController {

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

    @RequestMapping("/toToLogin")
    public String toToLogin() {
        return "toLogin";
    }

    @RequestMapping("/updatePwd")
    @ResponseBody
    public Map updatePwd(String upwd,  HttpSession session) {
        Map map = new HashMap();
        User param = (User)session.getAttribute("user");
        param.setUpwd(upwd);
        map.put("result", userMapper.updateByPrimaryKeySelective(param));
        return map;
    }

    @RequestMapping("/toUpdatePwd")
    public String toUpdatePwd() {
        return "updatePwd";
    }

    @RequestMapping("/findUserByUname")
    @ResponseBody
    public Map findUserByUname(String uname) {
        Map map = new HashMap();
        if (userMapper.findUserByUname(uname).size() == 0) {
            map.put("result", 0);
        } else {
            map.put("result", 1);
        }
        return map;
    }

    @RequestMapping("/registerToLogin")
    public ModelAndView registerToLogin() {
        ModelAndView mav = new ModelAndView("login");
        return mav;
    }

    @RequestMapping("/toRegister")
    public String toRegister(User user) {
        return "register";
    }

    @RequestMapping("/register")
    @ResponseBody
    public Map register(User user) {
        Map map = new HashMap();
        user.setIsDel(0);
        user.setType("user");
        int result = userMapper.insertSelective(user);
        map.put("result", result);
        return map;
    }

    //去登录页
    @RequestMapping("/toLogin")
    public ModelAndView toLogin(HttpServletRequest request, HttpServletResponse response) {
        List<User> userList = userMapper.selectAll();
        //查看cookie中是否有值
        Cookie[] c = request.getCookies();
        //定义两个全局变量（可将局部中的值带到全局使用）
        String uname = null;
        String upwd = null;
        //如果cookie中有值
        if (c != null) {
            //遍历cookie（键、值：账号名、密码）
            for (Cookie cookie : c) {
                //遍历商家集合（商家表中有账号名称和密码）
                for (User user : userList) {
                    //如果cookie中的键（账号名）  与  商家的账号名一致
                    if (cookie.getName().equals(user.getUname())) {
                        //将cookie的键（账号名）赋给 全局变量的姓名、密码空串
                        uname = cookie.getName();
                        upwd = cookie.getValue();
                    }
                }
            }
        }
        //执行上述代码后跳转到登录页面，把从cookie中取出的键（账号名）  赋予的字符串   传入前台   输入账号名的input标签的  value中
        ModelAndView mav = new ModelAndView("login", "uname", uname);
        mav.addObject("upwd", upwd);
        return mav;
    }

    //点击登录按钮
    @RequestMapping("/login")
    public String login(String uname, String upwd, String remember, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        User param = new User();
        param.setUname(uname);
        param.setUpwd(upwd);
        //判断是否点击“请记住我按钮”。空为没点击
        if (remember == null) {
            //根据用户名和密码查询商家
            User user = userMapper.selectByUnameAndUpwd(param);
            //商家对象有用户名和密码
            if (user != null) {
                //将用户名和密码存入session
                session.setAttribute("user", user);
                //跳至登录页面
                return "redirect:index";
            } else {//商家对象没有用户名和密码，跳到错误页
                return "error";
            }
        } else {//如果点击了“请记住我按钮”，创建cookie
            Cookie cookie = new Cookie(uname, upwd);
            //设置cookie的生命周期
            cookie.setMaxAge(60 * 60 * 24 * 365);
            //将账号、密码存入cookie中
            response.addCookie(cookie);

            User user = userMapper.selectByUnameAndUpwd(param);
            if (user != null) {
                session.setAttribute("user", user);
                return "redirect:index";
            } else {
                return "error";
            }

        }

    }


    @RequestMapping("/index")
    public String index(HttpSession session) {
        if (session.getAttribute("user") == null) {
            return "tologin";
        } else {
            return "index";
        }
    }


}
