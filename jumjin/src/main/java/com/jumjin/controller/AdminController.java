package com.jumjin.controller;


import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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

}
