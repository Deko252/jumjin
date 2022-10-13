package com.jumjin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("rouletteDAO")
public class RouletteDAO extends AbstractDAO{


	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> f_name(Map<String, Object> map) {
		return selectList("roulette.f_name", map);
	}

	

}
