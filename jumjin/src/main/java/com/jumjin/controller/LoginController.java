package com.jumjin.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
			if (login.get("b_grade").equals(0)) {
				//탈퇴한 사람이니까 로그인 페이지로 다시 이동
				return "redirect:/login.do?grade=0";
			}else {				
				System.out.println("일치합니다"+ login.get("b_grade"));
				//세션도 만들어주세요.
				session.setAttribute("name", login.get("b_name"));
				session.setAttribute("id", map.get("id"));				
				session.setAttribute("grade", login.get("b_grade"));
				
				
				return "redirect:/index.do";
			}
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
		if(session.getAttribute("grade") != null) {
			session.removeAttribute("grade");
		}
		
		return "redirect:/index.do";
	}
	
	@GetMapping("/join.do")
	public String join() {		
		return "join";
	}
	
	
	@PostMapping("/join.do")
	public String join(CommandMap map) {
		//사용자가 입력한 데이터를 데이터베이스에 저장하고 페이지 이동하는 메소드
		System.out.println(map.getMap());
		//{name=po1, pw2=01234657, id=poseidon1, pw1=01234567, email=email@email.co.kr}
		int result = loginService.join(map.getMap());
		
		//System.out.println("결과는 : " + result);
		return "redirect:/login.do?result=" + result;
	}
	@PostMapping("/idCheck.do")
	public @ResponseBody String idCheck(CommandMap map) {
		//System.out.println(map.getMap());//{id=ffffff}
		int result = loginService.idCheck(map.getMap());
		return String.valueOf(result);// 0 1
	}

	@GetMapping("/info.do")
	public ModelAndView info(CommandMap map, HttpSession session) {
		ModelAndView mv = new ModelAndView("info");
		//로그인 한 사용자만
		if(session.getAttribute("id") != null) {
			map.put("id", session.getAttribute("id"));
			//mv에 붙여보내기
			Map<String, Object> info = loginService.myInfo(map.getMap());
			mv.addObject("info", info);
			mv.setViewName("info");				
		}
		return mv;
	}
	@PostMapping("/info.do")
	public ModelAndView info1(CommandMap map, HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:/login.do");
		//로그인 한 사용자만
		if(session.getAttribute("id") != null && map.containsKey("pw")) {
			map.put("id", session.getAttribute("id"));
			//mv에 붙여보내기
			Map<String, Object> info = loginService.myInfo(map.getMap());
			mv.addObject("info", info);
			mv.setViewName("info");				
		}
		return mv;
	}
	
	@PostMapping("/password.do")
	public String password(CommandMap map, HttpSession session) {
		//세션검사
		if(session.getAttribute("id") != null) {
			//데이터 오는지 확인
			if(map.get("npw") != null) {
				//DB에 저장하기
				map.put("id", session.getAttribute("id"));
				System.out.println("오는 값 확인 : " + map.getMap());
				loginService.password(map.getMap());
			}
			//페이지 이동
		}
		return "redirect:/logout.do";
	}
}
