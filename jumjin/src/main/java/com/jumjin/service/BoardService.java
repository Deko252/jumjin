package com.jumjin.service;

import java.util.List;
import java.util.Map;

public interface BoardService {
	List<Map<String, Object>> boardList(Map<String, Object> map);
	
	List<Map<String, Object>> board2List(Map<String, Object> map);

	Map<String, Object> detail(Map<String, Object> map);

	void postDel(Map<String, Object> map);

	int write(Map<String, Object> map);//異붿긽硫붿냼�뱶 : �씠 �씤�꽣�럹�씠�뒪瑜� �궡�젮諛쏅뒗 �겢�옒�뒪媛� �셿�꽦

	int totalCount(Map<String, Object> map);

	int update(Map<String, Object> map);

	int commentWrite(Map<String, Object> map);

	List<Map<String, Object>> commentsList(Map<String, Object> map);

	int commentDel(Map<String, Object> map);

	Map<String, Object> detail2(Map<String, Object> map);
	
	int write2(Map<String, Object> map);

	int totalCount2(Map<String, Object> map);
}