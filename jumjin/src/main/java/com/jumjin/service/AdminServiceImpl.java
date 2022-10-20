package com.jumjin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jumjin.dao.AdminDAO;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO adminDAO;

	@Override
	public List<Map<String, Object>> boardList(Map<String, Object> map) {
		return adminDAO.boardList(map);
	}

	@Override
	public List<Map<String, Object>> userList() {
		return adminDAO.userList();
	}
	
	@Override
	public Map<String, Object> detail(Map<String, Object> map) {
		return adminDAO.detail();
	}

	@Override
	public int totalCount(Map<String, Object> map) {
		return adminDAO.totalCount(map);
	}

	@Override
	public void postChange(Map<String, Object> map) {
		adminDAO.postChange(map);
	}
	

}
