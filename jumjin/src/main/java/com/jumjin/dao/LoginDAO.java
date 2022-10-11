package com.jumjin.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public class LoginDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public Map<String, Object> login(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("login.login", map);
	}

}
