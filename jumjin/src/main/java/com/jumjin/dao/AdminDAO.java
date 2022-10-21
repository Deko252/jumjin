package com.jumjin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("adminDAO")
public class AdminDAO extends AbstractDAO {
	

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> boardList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("admin.boardList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> userList(Map<String, Object> map) {
		return selectList("admin.userList", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> detail() {
		return (Map<String, Object>) selectOne("admin.detail");
	}

	public int totalCount(Map<String, Object> map) {
		return  (int) selectOne("admin.totalCount", map);
	}

	public void postChange(Map<String, Object> map) {
		update("admin.postChange", map);	
	}

	public int userGradeAJAX(Map<String, Object> map) {
		return (int) update("admin.userGradeAJAX", map);
	}

	public int userCount(Map<String, Object> map) {
		return (int) selectOne("admin.userCount", map);
	}
}
