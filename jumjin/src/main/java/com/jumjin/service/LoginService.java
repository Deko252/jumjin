package com.jumjin.service;

import java.util.Map;

public interface LoginService {

	Map<String, Object> login(Map<String, Object> map);

	int join(Map<String, Object> map);

	int idCheck(Map<String, Object> map);

	Map<String, Object> myInfo(Map<String, Object> map);

	void password(Map<String, Object> map);
	
}
