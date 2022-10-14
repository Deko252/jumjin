package com.jumjin.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public class LoginDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public Map<String, Object> login(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("login.login", map);
	}

	public int join(Map<String, Object> map) {
		return (int) insert("login.join", map);
	}

	public int idCheck(Map<String, Object> map) {
		return (int) selectOne("login.idCheck", map);
	}

}
