package com.hc.service;

import com.hc.pojo.Admin;

public interface AdminService {

	Admin selectByAdmin(String aname,String apwd);
}
