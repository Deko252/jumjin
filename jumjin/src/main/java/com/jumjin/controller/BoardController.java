package com.jumjin.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jumjin.common.CommandMap;
import com.jumjin.service.BoardService;
import com.jumjin.util.Util;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class BoardController {

	@Resource(name = "boardService")
	private BoardService boardService;

	@Autowired
	private ServletContext servletContext;

	@GetMapping("/board.do")
	public ModelAndView board(CommandMap map) {
		ModelAndView mv = new ModelAndView("board");

		if (!map.containsKey("cate")) {
			map.put("cate", 1);
		}

		// pageNo
		int pageNo = 1;
		if (map.containsKey("pageNo")) {
			pageNo = Util.strToInt((String) map.get("pageNo"));
		}

		// totalCount
		int totalCount = boardService.totalCount(map.getMap());

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pageNo);
		paginationInfo.setRecordCountPerPage(10);
		paginationInfo.setPageSize(10);
		paginationInfo.setTotalRecordCount(totalCount);

		int startPage = paginationInfo.getFirstRecordIndex();// 0
		int lastPage = paginationInfo.getRecordCountPerPage();// 10

		map.put("startPage", startPage);
		map.put("lastPage", lastPage);

		List<Map<String, Object>> list = boardService.boardList(map.getMap());

		mv.addObject("list", list);
		mv.addObject("pageNo", pageNo);
		mv.addObject("paginationInfo", paginationInfo);
		mv.addObject("cate", map.get("cate"));
		
		return mv;
	}
	
	@GetMapping("/board2.do")
	public ModelAndView board2(CommandMap map) {
		ModelAndView mv = new ModelAndView("board2");

		if (!map.containsKey("cate")) {
			map.put("cate", 2);
		}

		// pageNo
		int pageNo = 1;
		if (map.containsKey("pageNo")) {
			pageNo = Util.strToInt((String) map.get("pageNo"));
		}

		// totalCount
		int totalCount = boardService.totalCount(map.getMap());

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pageNo);
		paginationInfo.setRecordCountPerPage(10);
		paginationInfo.setPageSize(10);
		paginationInfo.setTotalRecordCount(totalCount);

		int startPage = paginationInfo.getFirstRecordIndex();// 0
		int lastPage = paginationInfo.getRecordCountPerPage();// 10

		map.put("startPage", startPage);
		map.put("lastPage", lastPage);

		List<Map<String, Object>> list = boardService.board2List(map.getMap());

		mv.addObject("list", list);
		mv.addObject("pageNo", pageNo);
		mv.addObject("paginationInfo", paginationInfo);
		mv.addObject("cate", map.get("cate"));
		
		return mv;
	}

	@GetMapping("/update.do")
	public ModelAndView update(HttpSession session, CommandMap map) {
		ModelAndView mv = new ModelAndView("redirect:/error.do?error=error");
		if (session.getAttribute("id") != null) {
			map.put("id", session.getAttribute("id"));
		
			if (map.containsKey("bno")) {
				Map<String, Object> detail = boardService.detail(map.getMap());
				if (detail != null) {
					mv.addObject("detail", detail);
					mv.setViewName("update");
				}
			}
		}
		return mv;
	}

	@PostMapping("/update.do")
	public String update(CommandMap map, HttpSession session) {
		if (session.getAttribute("id") != null) {
			if (map.containsKey("title") && map.containsKey("content") && map.containsKey("cate")
					&& map.containsKey("board_no")) {

				map.put("id", session.getAttribute("id"));
			
				int result = boardService.update(map.getMap());

		

				
				return "redirect:/board.do?cate=" + map.get("cate") + "&bno=" + map.get("board_no") + "&result="
						+ result;
			} else {
				return "redirect:/error.do";
			}
		} else {
			return "redirect:/login.do";
		}
	}

	@GetMapping("/detail.do")
	public ModelAndView detail(CommandMap commandMap) {
		ModelAndView mv = new ModelAndView();
	
		Map<String, Object> detail = boardService.detail(commandMap.getMap());
		mv.addObject("detail", detail);
	
		System.out.println("commentCount : " + detail.get("commentCount"));
		if (Integer.parseInt(String.valueOf(detail.get("commentCount"))) > 0) {

			List<Map<String, Object>> comments = boardService.commentsList(commandMap.getMap());
			mv.addObject("commentsList", comments);
		}

		return mv;
	}
	
	@GetMapping("/detail2.do")
	public ModelAndView detail2(CommandMap commandMap) {
		ModelAndView mv = new ModelAndView();
	
		Map<String, Object> detail2 = boardService.detail2(commandMap.getMap());
		mv.addObject("detail", detail2);
	
		System.out.println("commentCount : " + detail2.get("commentCount"));
		if (Integer.parseInt(String.valueOf(detail2.get("commentCount"))) > 0) {

			List<Map<String, Object>> comments = boardService.commentsList(commandMap.getMap());
			mv.addObject("commentsList", comments);
		}

		return mv;
	}
	
	@PostMapping("/save.do")
	public Map<String, Object> star(CommandMap map) {
		
		Map<String, Object> result = map.getMap();
		System.out.println("별 " + result);
		return result;
	}
	
	

	@GetMapping("/postDel.do")
	public String postDel(CommandMap map, HttpSession session) {
		// System.out.println(map.getMap());//{bno=48}
		if (session.getAttribute("id") != null) {
			map.put("id", session.getAttribute("id"));
			boardService.postDel(map.getMap());
		

			return "redirect:/board.do?cate=" + map.get("cate");
		} else {
			return "redirect:/login.do";
		}

	}

	@GetMapping("/write.do")
	public String write(HttpSession session) {
		if (session.getAttribute("id") != null) {
			return "write";
		} else {
			return "redirect:/login.do";
		}
	}

	@PostMapping("/write.do")
	public String write(CommandMap map, HttpSession session, MultipartFile file) throws IOException {

		if (session.getAttribute("id") != null) {

			if (map.get("title") != null && map.get("content") != null) {// �솗�씤�빐蹂닿린

				map.put("id", session.getAttribute("id"));

				String realPath = servletContext.getRealPath("resources/upload");

				String fileName = Util.save(realPath, file);

				map.put("file", fileName);

				int result = boardService.write(map.getMap());
			

				return "redirect:/board.do?cate=" + map.get("cate") + "&result=" + result;
			} else {
				return "redirect:/write.do?error=1250";
			}
		} else {
			return "redirect:/login.do?error=login";
		}
	}
	

	@PostMapping("/commentWrite.do")
	public String commentWrite(CommandMap map, HttpSession session) {
		String url = "redirect:/login.do";

		if (session.getAttribute("id") != null) {

			map.put("id", session.getAttribute("id"));
			int result = boardService.commentWrite(map.getMap());

			url = "redirect:/detail.do?bno=" + map.get("bno") + "&result=" + result;
		}
		return url;
	}

	@GetMapping("/commentDel.do")
	public String commentDel(CommandMap map, HttpSession session) {
		int result = 0;
		if (session.getAttribute("id") != null) {
			map.put("id", session.getAttribute("id"));

			result = boardService.commentDel(map.getMap());
		}
		return "redirect:/detail.do?cate=" + map.get("cate") + "&bno=" + map.get("bno") + "&result=" + result;
	}

}