package com.jumjin.controller;



import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jumjin.common.CommandMap;
import com.jumjin.service.AdminService;
import com.jumjin.service.BoardService;
import com.jumjin.util.Util;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;


@Controller
@RequestMapping("/admin")
public class AdminController {

	@Resource(name = "adminService")
	private AdminService adminService;
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
	@GetMapping("/admin_main.do")
	public String login(CommandMap map) {
		return "/admin/admin_main";
	}
	@GetMapping("/admin_board.do")
	public ModelAndView admin_board(CommandMap map) {
		ModelAndView mv = new ModelAndView("admin/admin_board");
	
		/*
		 * //데이터 List<Map<String, Object>> boardList = adminService.boardList();
		 * mv.addObject("boardList", boardList);
		 */ 
		
		int pageNo = 1;
		if (map.containsKey("pageNo")) {
			pageNo = Util.strToInt((String) map.get("pageNo"));
		}

		// totalCount
		int totalCount = adminService.totalCount(map.getMap());

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pageNo);
		paginationInfo.setRecordCountPerPage(10);
		paginationInfo.setPageSize(10);
		paginationInfo.setTotalRecordCount(totalCount);

		int startPage = paginationInfo.getFirstRecordIndex();// 0
		int lastPage = paginationInfo.getRecordCountPerPage();// 10

		map.put("startPage", startPage);
		map.put("lastPage", lastPage);

		List<Map<String, Object>> list = adminService.boardList(map.getMap());

		mv.addObject("list", list);
		mv.addObject("pageNo", pageNo);
		mv.addObject("paginationInfo", paginationInfo);
		
		return mv; 
	}
	
	@GetMapping("/admin_user.do")
	public ModelAndView userList(CommandMap map) {
		ModelAndView mv = new ModelAndView("admin/admin_user");
		// 데이터
		
		int pageNo = 1;
		if (map.containsKey("pageNo")) {
			pageNo = Util.strToInt((String) map.get("pageNo"));
		}

		// totalCount
		int totalCount = adminService.userCount(map.getMap());

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pageNo);
		paginationInfo.setRecordCountPerPage(10);
		paginationInfo.setPageSize(10);
		paginationInfo.setTotalRecordCount(totalCount);

		int startPage = paginationInfo.getFirstRecordIndex();// 0
		int lastPage = paginationInfo.getRecordCountPerPage();// 10
		System.out.println(startPage);
		System.out.println(lastPage);

		map.put("startPage", startPage);
		map.put("lastPage", lastPage);
		
		List<Map<String, Object>> userList = adminService.userList(map.getMap());
		mv.addObject("userList", userList);
		mv.addObject("pageNo", pageNo);
		mv.addObject("paginationInfo", paginationInfo);
		
		return mv; 
	}
	//2020-09-30 poseidon 상세보기 새로운 창으로 열리게 하기
	/*
	 * @GetMapping("/detail.do") public ModelAndView detail(CommandMap map)
	 * {//{bno=175} ModelAndView mv = new ModelAndView("admin/detail"); //가져올 데이터
	 * detail //commandMap은 채집용, 전송은 getMap()으로 Map<String, Object> detail =
	 * adminService.detail(map.getMap()); //한줄 정보를 담기 위해서 map //그런 여러줄을 저장하려면 List
	 * 
	 * mv.addObject("detail", detail); return mv; }
	 */
		
		@GetMapping("/postDel.do")
		public String postDel(CommandMap map) {
			map.put("del", 1);//1로 바꿔라
			adminService.postChange(map.getMap());
			return "redirect:/admin/admin_board.do";
		}
		
		@GetMapping("/postRemove.do")
		public String postRemove(CommandMap map) {
			map.put("del", 0);//0으로 바꿔라
			adminService.postChange(map.getMap());
			return "redirect:/admin/admin_board.do";	
		}
		
		@PostMapping("/userGradeAJAX.do")
		public @ResponseBody String userGradeAJAX(CommandMap map) {
			//System.out.println(map.getMap());//{bno=2, grade=0}
			int result = adminService.userGradeAJAX(map.getMap());
			
			return String.valueOf(result);
		}
		@GetMapping("/admin_detail.do")
		public ModelAndView admin_detail(CommandMap commandMap) {
			ModelAndView mv = new ModelAndView("admin_detail");
		
			Map<String, Object> admin_detail = adminService.admin_detail(commandMap.getMap());
			mv.addObject("admin_detail", admin_detail);
			System.out.println(admin_detail);
		
			System.out.println("commentCount : " + admin_detail.get("commentCount"));
			if (Integer.parseInt(String.valueOf(admin_detail.get("commentCount"))) > 0) {

				List<Map<String, Object>> comments = boardService.commentsList2(commandMap.getMap());
				mv.addObject("commentsList2", comments);
			}

			return mv;
		}
}
