package com.hxx.drug.util;

import org.apache.commons.codec.binary.Hex;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @Description
 * @auther qiyong
 * @create 2018-11-26 17:30
 */
public class Tool {

    /**
     *  时间转换
     * @param date
     * @return String
     */
    public static String  dateToString(Date date){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //获取String类型的时间
        String time = sdf.format(date);
        return time;
    }

    /**
     * 密码加密
     * @param password
     * @return String
     */
    public static String encodePassword(String password){
        //
        //password = "gxzcwefxcbergfd123456errttyyytytrnfzeczxcvertwqqcxvxb";
        //1:MD5  算法
        String algorithm = "MD5";
        char[] encodeHex = null;
        try {
            //MD5加密
            MessageDigest instance = MessageDigest.getInstance(algorithm);
            //加密后
            byte[] digest = instance.digest(password.getBytes());

            //
            //2:十六进制
            encodeHex = Hex.encodeHex(digest);
        } catch (NoSuchAlgorithmException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return new String(encodeHex);
    }
}
