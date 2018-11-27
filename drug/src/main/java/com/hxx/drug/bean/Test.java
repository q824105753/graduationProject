package com.hxx.drug.bean;

import com.hxx.drug.util.Tool;

/**
 * @Description
 * @auther qiyong
 * @create 2018-11-27 15:49
 */
public class Test {
    public static void main(String[] args) {
        String upwd = "admin";
        System.out.println(Tool.encodePassword(upwd));
    }
}
