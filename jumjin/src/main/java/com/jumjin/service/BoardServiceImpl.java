package com.jumjin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jumjin.dao.BoardDAO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	public List<Map<String, Object>> boardList(Map<String, Object> map) {
		return boardDAO.boardList(map);
	}
	
	@Override
	public Map<String, Object> detail(Map<String, Object> map) {
		return boardDAO.detail(map);
	}

	@Override
	public void postDel(Map<String, Object> map) {
		boardDAO.postDel(map);
	}

	@Override
	public int write(Map<String, Object> map) {
		//�꽌鍮꾩뒪 -> dao -> 
		return boardDAO.write(map);
	}

	@Override
	public int totalCount(Map<String, Object> map) {
		return boardDAO.totalCount(map);
	}

	@Override
	public int update(Map<String, Object> map) {
		return boardDAO.update(map);
	}

	@Override
	public int commentWrite(Map<String, Object> map) {
		if(map.containsKey("cno")){
			return boardDAO.commentUpdate(map);			
		} else {			
			return boardDAO.commentWrite(map);
		}
	}

	@Override
	public List<Map<String, Object>> commentsList(Map<String, Object> map) {
		return boardDAO.commentsList(map);
	}

	@Override
	public int commentDel(Map<String, Object> map) {
		return boardDAO.commentDel(map);
	}

	@Override
	public List<Map<String, Object>> board2List(Map<String, Object> map) {
		return boardDAO.board2List(map);
	}

	@Override
	public Map<String, Object> detail2(Map<String, Object> map) {
		return boardDAO.detail2(map);
	}

}
