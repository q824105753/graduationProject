package com.qy.service;

import java.util.List;

import com.qy.pojo.Message;

public interface MessageService {
	
    int insert(Message record);
    
    List<Message> selectAll();
}
