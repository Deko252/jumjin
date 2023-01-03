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
	
	public void postDel2(Map<String, Object> map) {
		update("board.postDel2", map);
	}
	

	public int write(Map<String, Object> map) {
		//dao -> sqlSession
		int result =   (int) insert("board.write", map);
		return result;
	}

	public int update(Map<String, Object> map) {
		return (int) update("board.update", map);
	}
	
	public int update2(Map<String, Object> map) {
		return (int) update("board.update2", map);
	}

	public void log(Map<String, Object> log) {
		insert("board.log", log);
		
	}

	public int commentWrite(Map<String, Object> map) {
		return (int) insert("board.commentWrite", map);
	}

	public int commentWrite2(Map<String, Object> map) {
		return (int) insert("board.commentWrite2", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> commentsList(Map<String, Object> map) {
		return selectList("board.commentsList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> commentsList2(Map<String, Object> map) {
		return selectList("board.commentsList2", map);
	}

	public int commentDel(Map<String, Object> map) {
		return (int) delete("board.commentDel", map);
	}

	public int commentUpdate(Map<String, Object> map) {
		return  (int) update("board.commentUpdate", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> board2List(Map<String, Object> map) {
		return selectList("board.board2List", map);
	}
	
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> detail2(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("board.detail2", map);
	}

	public int write2(Map<String, Object> map) {
		int result =   (int) insert("board.write2", map);
		return result;
	}

	public int totalCount2(Map<String, Object> map) {
		return (int) selectOne("board.totalCount2", map);
	}

	public int commentDel2(Map<String, Object> map) {
		return (int) delete("board.commentDel2", map);
	}

	public int commentUpdate2(Map<String, Object> map) {
		return  (int) update("board.commentUpdate2", map);
	}

	public int viewcount(Object object) {
		return  (int) update("board.viewcount", object);
	}

	public void like(Map<String, Object> map) {
		update("board.like", map);
		
	}

	
}
