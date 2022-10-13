package com.jumjin.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jumjin.common.CommandMap;
import com.jumjin.service.RouletteService;

@Controller
public class RouletteController {
	
	@Resource(name = "rouletteService")
	private RouletteService rouletteService;
	
	@GetMapping(value = "/roulette.do")
	public ModelAndView roulette(CommandMap map) throws Exception {
		ModelAndView mv = new ModelAndView("roulette");
		//stem.out.println("/roulette.do");
		List<Map<String, Object>> f_name = rouletteService.f_name(map.getMap());
		//System.out.println(f_name);
		
		Set<Integer> f_ran = new HashSet<Integer>();
		while (f_ran.size() < 8) {
			f_ran.add( (int) (Math.random() * 45));//0~44
		}
		
		List<String> r = new ArrayList<String>();
		for (Integer integer : f_ran) {
			r.add((String) f_name.get(integer).get("f_name"));
		}
		//System.out.println("결과는 : " + r);
		//비빔밥, 파스타, 칼국수, 오코노미야키, 치킨, 스테이크, 잡채밥, 찌개
		//초밥, 소바, 샤브샤브, 짜장면, 마파두부, 찜닭, 잡채밥, 찌개
		
		mv.addObject("result", r);
		return mv;
	}
	
}

