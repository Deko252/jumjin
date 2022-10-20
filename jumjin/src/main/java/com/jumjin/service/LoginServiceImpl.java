package com.jumjin.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jumjin.dao.LoginDAO;

@Service("loginService")
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginDAO loginDAO;

	@Override
	public Map<String, Object> login(Map<String, Object> map) {
		return loginDAO.login(map);
	}

	@Override
	public int join(Map<String, Object> map) {
		return loginDAO.join(map);	
	}

	@Override
	public int idCheck(Map<String, Object> map) {
		return loginDAO.idCheck(map);
	}

	@Override
	public Map<String, Object> myInfo(Map<String, Object> map) {
		return loginDAO.myInfo(map);
	}

	@Override
	public void password(Map<String, Object> map) {
		loginDAO.password(map);
	}

}
