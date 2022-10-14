package com.jumjin.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jumjin.common.CommandMap;

@Controller
public class IndexController {
	Logger log = Logger.getLogger(this.getClass());

	@GetMapping(value = "/index.do")
	public ModelAndView index(CommandMap map) throws Exception {
		ModelAndView mv = new ModelAndView("index");
		return mv;
	}
	
	@GetMapping(value = "/ghostLeg.do")
	public ModelAndView ghostLeg(CommandMap map) throws Exception {
		ModelAndView mv = new ModelAndView("ghostLeg");
		return mv;
	}
	@GetMapping(value = "/map.do")
	public ModelAndView map(CommandMap map) throws Exception {
		ModelAndView mv = new ModelAndView("map");
		return mv;
	}
	
	@GetMapping(value = "/info.do")
	public ModelAndView info(CommandMap map) throws Exception {
		ModelAndView mv = new ModelAndView("info");
		return mv;
	}
	
}