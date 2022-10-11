package com.jumjin.controller;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jumjin.common.CommandMap;
import com.jumjin.service.AdminService;


@Controller
@RequestMapping("/admin")
public class AdminController {

	@Resource(name = "adminService")
	private AdminService adminService;
	
	@GetMapping("/admin_main.do")
	public String login(CommandMap map) {
		return "/admin/admin_main";
	}
	@GetMapping("/admin_board.do")
	public String admin_board(CommandMap map) {
		return "/admin/admin_board"; 
	}
	@GetMapping("/admin_user.do")
	public String admin_user(CommandMap map) {
		return "/admin/admin_user";
	}
}
