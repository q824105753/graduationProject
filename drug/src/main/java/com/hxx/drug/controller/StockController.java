package com.hxx.drug.controller;

import cn.itcast.common.page.Pagination;
import com.hxx.drug.bean.Drug;
import com.hxx.drug.bean.Stock;
import com.hxx.drug.bean.User;
import com.hxx.drug.dao.*;
import com.hxx.drug.util.Tool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Description
 * @auther qiyong
 * @create 2018-11-23 15:57
 */
@Controller
public class StockController {

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

    @RequestMapping("/toStockAdd")
    public ModelAndView toStockAdd() {
        ModelAndView mav = new ModelAndView("stock-add","dlist",drugMapper.selectAllNoParame());
        return mav;
    }

    @RequestMapping("/stockList")
    public ModelAndView toDrug(Stock stock, Integer pageNo) {
        if (stock.getSize() == null) {
            stock.setSize(6);
        }
        if (pageNo == null) {
            pageNo = 1;
        }
        ModelAndView mav = new ModelAndView("stock", "page", findAllStock(stock, pageNo));
        return mav;
    }

    @RequestMapping("/selectStockById")
    public ModelAndView selectStockById(Integer sid) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("stock", stockMapper.selectByPrimaryKey(sid));
        return mav;
    }

    @RequestMapping("/insertStock")
    @ResponseBody
    public Map insertStock(Stock stock,HttpSession session) {
        Map map = new HashMap();
        Drug drug = drugMapper.selectByPrimaryKey(stock.getDid());
        if(drug==null){
            stock.setUpdateTime(Tool.dateToString(new Date()));
            User user = (User)session.getAttribute("user");
            stock.setUid(user.getUid());
            map.put("result", stockMapper.insertSelective(stock));
        }
        map.put("result", -1);
        return map;
    }

    @RequestMapping("/delStock")
    @ResponseBody
    public Map delStock(Integer sid) {
        Map map = new HashMap();
        map.put("result", stockMapper.deleteByPrimaryKey(sid));
        return map;
    }

    @RequestMapping("/updateStock")
    @ResponseBody
    public Map updateStock(Stock stock,HttpSession session) {
        Map map = new HashMap();
        stock.setUpdateTime(Tool.dateToString(new Date()));
        User user = (User)session.getAttribute("user");
        stock.setUid(user.getUid());
        map.put("result", stockMapper.updateByPrimaryKeySelective(stock));
        return map;
    }

    Pagination findAllStock(Stock stock, Integer pageNo) {
        stock.setCurrentPage((pageNo - 1) * stock.getSize());
        List<Stock> slist = stockMapper.selectAll(stock);
        for(Stock stock1:slist){
            stock1.setDrug(drugMapper.selectByPrimaryKey(stock1.getDid()));
        }
        Integer count = stockMapper.selectCount(stock);
        Pagination page = new Pagination(pageNo, stock.getSize(), count);
        StringBuilder params = new StringBuilder();
        params.append("size=" + stock.getSize());
        String url = "/stockList";
        page.setList(slist);
        page.pageView(url, params.toString());
        return page;
    }
}
