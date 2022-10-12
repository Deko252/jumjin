package com.jumjin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("boardDAO")
public class BoardDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> boardList(Map<String, Object> map) {
		return selectList("board.boardList", map);
	}

	public int totalCount(Map<String, Object> map) {
		return (int) selectOne("board.totalCount", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> detail(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("board.detail", map);
	}

	public void postDel(Map<String, Object> map) {
		update("board.postDel", map);
	}

	public int write(Map<String, Object> map) {
		//dao -> sqlSession
		int result =   (int) insert("board.write", map);
		return result;
	}

	public int update(Map<String, Object> map) {
		return (int) update("board.update", map);
	}

	public void log(Map<String, Object> log) {
		insert("board.log", log);
		
	}

	public int commentWrite(Map<String, Object> map) {
		return (int) insert("board.commentWrite", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> commentsList(Map<String, Object> map) {
		return selectList("board.commentsList", map);
	}

	public int commentDel(Map<String, Object> map) {
		return (int) delete("board.commentDel", map);
	}

	public int commentUpdate(Map<String, Object> map) {
		return  (int) update("board.commentUpdate", map);
	}
	
}
