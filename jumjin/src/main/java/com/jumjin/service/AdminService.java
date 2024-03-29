package com.jumjin.service;

import java.util.List;
import java.util.Map;

public interface AdminService {

	List<Map<String, Object>> boardList(Map<String, Object> map);

	List<Map<String, Object>> userList(Map<String, Object> map);

	Map<String, Object> detail(Map<String, Object> map);

	void postChange(Map<String, Object> map);

	int userGradeAJAX(Map<String, Object> map);
	
	int totalCount(Map<String, Object> map);

	int userCount(Map<String, Object> map);

	Map<String, Object> admin_detail(Map<String, Object> map);

}
