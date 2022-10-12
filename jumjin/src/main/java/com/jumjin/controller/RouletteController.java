package com.jumjin.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jumjin.common.CommandMap;

@Controller
public class RouletteController {
	
	@GetMapping(value = "/roulette.do")
	public ModelAndView roulette(CommandMap map) throws Exception {
		ModelAndView mv = new ModelAndView("roulette");
		Set<Integer> f_ran = new HashSet<Integer>();
		while (f_ran.size() < 8) {
			f_ran.add( (int) (Math.random() * 45 + 1));
		}
		List<Integer> r = new ArrayList<Integer>(f_ran);
		mv.addObject("r", r);
		return mv;
	}
	
}

