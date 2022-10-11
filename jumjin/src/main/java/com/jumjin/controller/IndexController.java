package com.jumjin.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jumjin.common.CommandMap;

@Controller
public class IndexController {
	Logger log = Logger.getLogger(this.getClass());

	@GetMapping(value = "/main.do")
	public ModelAndView main(CommandMap map) throws Exception {
		ModelAndView mv = new ModelAndView("main");
		return mv;
	}
}