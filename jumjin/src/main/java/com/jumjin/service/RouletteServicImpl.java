package com.jumjin.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.jumjin.dao.RouletteDAO;

@Service("rouletteService")
public class RouletteServicImpl implements RouletteService {

	@Override
	public Map<String, Object> roulette(Map<String, Object> map) {
		return RouletteDAO.roulette(map);
	}

}
