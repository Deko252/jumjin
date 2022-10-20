package com.jumjin.service;

import java.util.List;
import java.util.Map;

public interface AdminService {

	List<Map<String, Object>> boardList(Map<String, Object> map);

	List<Map<String, Object>> userList();

	Map<String, Object> detail(Map<String, Object> map);

	int totalCount(Map<String, Object> map);

	void postChange(Map<String, Object> map);

}
