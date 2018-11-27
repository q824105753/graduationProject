package com.hxx.drug.util;

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
}
