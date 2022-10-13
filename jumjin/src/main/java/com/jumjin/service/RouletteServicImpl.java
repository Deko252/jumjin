package com.jumjin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jumjin.dao.RouletteDAO;

@Service("rouletteService")
public class RouletteServicImpl implements RouletteService {

	@Autowired
	private RouletteDAO rouletteDAO;

	@Override
	public List<Map<String, Object>> f_name(Map<String, Object> map) {
		return rouletteDAO.f_name(map);
	}

}
