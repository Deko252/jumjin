package com.jumjin.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jumjin.common.CommandMap;
import com.jumjin.service.LoginService;

@Controller
public class LoginController {

	@Resource(name = "loginService")
	private LoginService loginService;

	@GetMapping("/login.do")
	public String login() {
		return "login";
	}

	@PostMapping("/login.do")
	public String login(CommandMap map, HttpSession session) {
		System.out.println(map.getMap());// {pw=01234567, id=jumjin}
		//서비스에게 일 시키기
		Map<String, Object> login = loginService.login(map.getMap());
		
		
		if(String.valueOf(login.get("count")).equals("0")) {
			System.out.println("일치하지 않습니다.");
			
			return "redirect:/login.do?error=2580";
			
		} else {
			System.out.println("일치합니다");
			//세션도 만들어주세요.
			session.setAttribute("name", login.get("b_name"));
			session.setAttribute("id", map.get("id"));
			
			return "redirect:/index.do";
		}
	}
	
	@GetMapping("/logout.do")
	public String logout(HttpSession session) {
		//세션 종료
		//session.invalidate();//전체 종료
		if(session.getAttribute("id") != null) {			
			session.removeAttribute("id");
		}
		if(session.getAttribute("name") != null) {
			session.removeAttribute("name");
		}
		
		return "redirect:/index.do";
	}

}
