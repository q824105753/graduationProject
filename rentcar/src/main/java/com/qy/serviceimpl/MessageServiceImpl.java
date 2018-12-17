package com.qy.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qy.mapper.MessageMapper;
import com.qy.pojo.Message;
import com.qy.service.MessageService;
@Service("messageService")
public class MessageServiceImpl implements MessageService {

	@Autowired
	private MessageMapper messageMapper;
	
	public int insert(Message record) {
		return messageMapper.insert(record);
	}

	
	public List<Message> selectAll() {
		return messageMapper.selectAll();
	}

}
