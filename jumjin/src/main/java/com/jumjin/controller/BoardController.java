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
		int totalCount = boardService.totalCount2(map.getMap());

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

				return "redirect:/board.do?bno=" + map.get("board_no") + "&result="
						+ result;
			} else {
				return "redirect:/error.do";
			}
		} else {
			return "redirect:/login.do";
		}
	}
	
	@GetMapping("/update2.do")
	public ModelAndView update2(HttpSession session, CommandMap map) {
		ModelAndView mv = new ModelAndView("redirect:/error.do?error=error");
		if (session.getAttribute("id") != null) {
			map.put("id", session.getAttribute("id"));
		
			if (map.containsKey("bno")) {
				Map<String, Object> detail2 = boardService.detail2(map.getMap());
				if (detail2 != null) {
					mv.addObject("detail2", detail2);
					mv.setViewName("update2");
				}
			}
		}
		return mv;
	}

	@PostMapping("/update2.do")
	public String update2(CommandMap map, HttpSession session) {
		if (session.getAttribute("id") != null) {
			if (map.containsKey("title") && map.containsKey("content") && map.containsKey("cate")
					&& map.containsKey("board_no")) {

				map.put("id", session.getAttribute("id"));
			
				int result = boardService.update2(map.getMap());

				return "redirect:/board2.do?bno=" + map.get("board_no") + "&result="
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
		ModelAndView mv = new ModelAndView("detail2");
	
		Map<String, Object> detail2 = boardService.detail2(commandMap.getMap());
		mv.addObject("detail2", detail2);
		System.out.println(detail2);
	
		//System.out.println("commentCount : " + detail2.get("commentCount"));
		if (Integer.parseInt(String.valueOf(detail2.get("commentCount"))) > 0) {

			List<Map<String, Object>> comments = boardService.commentsList2(commandMap.getMap());
			mv.addObject("commentsList2", comments);
		}
		//System.out.println(" board_no : " + detail2.get("board_no"));
		
		//조회수
		boardService.viewcount(detail2.get("board_no"));
		
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
		

			return "redirect:/board2.do";
		} else {
			return "redirect:/login.do";
		}

	}
	
	@GetMapping("/postDel2.do")
	public String postDel2(CommandMap map, HttpSession session) {
		// System.out.println(map.getMap());//{bno=48}
		if (session.getAttribute("id") != null) {
			map.put("id", session.getAttribute("id"));
			boardService.postDel2(map.getMap());
		

			return "redirect:/board2.do";
		} else {
			return "redirect:/login.do";
		}

	}
	

	@GetMapping("/write.do")
	public String write(HttpSession session) {
		if (session.getAttribute("id") != null && Integer.parseInt(String.valueOf(session.getAttribute("grade")))  == 1) {
			return "write";
		} else {
			return "redirect:/board.do";
		}
	}

	@PostMapping("/write.do")
	public String write(CommandMap map, HttpSession session, MultipartFile file) throws IOException {

		if (session.getAttribute("id") != null && Integer.parseInt(String.valueOf(session.getAttribute("grade")))  == 1) {
			
			
			if (map.get("title") != null && map.get("content") != null) {

				map.put("id", session.getAttribute("id"));

				
					String realPath = servletContext.getRealPath("resources/upload");
					String fileName = Util.save(realPath, file);
					
					map.put("file", fileName);
				
				
					
				
				int result = boardService.write(map.getMap());
			

				return "redirect:/board.do?result=" + result;
			} else {
				return "redirect:/write.do?error=1250";
			}
		} else {
			return "redirect:/login.do?error=login";
		}
	}
	
	@GetMapping("/write2.do")
	public String write2(HttpSession session) {
		if (session.getAttribute("id") != null) {
			return "write2";
		} else {
			return "redirect:/login.do";
		}
	}

	@PostMapping("/write2.do")
	public String write2(CommandMap map, HttpSession session, MultipartFile file) throws IOException {
		System.out.println(file.getSize());
		if (session.getAttribute("id") != null) {

			if (map.get("title") != null && map.get("content") != null) {
				map.put("id", session.getAttribute("id"));


				if(!file.isEmpty()) {
					String realPath = servletContext.getRealPath("resources/upload");
					String fileName = Util.save(realPath, file);
					
				
					map.put("file", fileName);
				}
				
				if (map.get("title") != null) {
					String com = (String) map.get("title");
					com = com.replaceAll("<", "&lt;");
					com = com.replaceAll(">", "&gt;");
					System.out.println(com+"-----------------------------------------");
					map.put("title", com);
				}
					
				int result = boardService.write2(map.getMap());
			

				return "redirect:/board2.do?result=" + result;
			} else {
				return "redirect:/write2.do?error=1250";
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
	
	@PostMapping("/commentWrite2.do")
	public String commentWrite2(CommandMap map, HttpSession session) {
		String url = "redirect:/login.do";
		if (session.getAttribute("id") != null) {
			map.put("id", session.getAttribute("id"));
			
			if (map.get("comment") != null) {
				String com = (String) map.get("comment");
				com = com.replaceAll("<", "&lt;");
				com = com.replaceAll(">", "&gt;");
				System.out.println(com+"-----------------------------------------");
				map.put("comment", com);
			}
			
			
			
			int result = boardService.commentWrite2(map.getMap());
						
			url = "redirect:/detail2.do?bno=" + map.get("bno") + "&result=" + result;
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
		return "redirect:/detail.do?bno=" + map.get("bno") + "&result=" + result;
	}
	
	@GetMapping("/commentDel2.do")
	public String commentDel2(CommandMap map, HttpSession session) {
		int result = 0;
		if (session.getAttribute("id") != null) {
			map.put("id", session.getAttribute("id"));

			result = boardService.commentDel2(map.getMap());
		}
		return "redirect:/detail2.do?bno=" + map.get("bno") + "&result=" + result;
	}
	
	//좋아요 - 수정필요 : 한 글에 한 번만 누를 수 있도록 테이블을 만들어야 함.
	@GetMapping("/like")
	public String like(CommandMap map) {
		//System.out.println(map.get("bno"));//{mb_cate=1, mb_no=90, pageNo=10}
		boardService.like(map.get("bno"));
		//String url = "forward:/detail2.do?bno=" + map.get("bno");
		
		return "redirect:/detail2.do?bno=" + map.get("bno");
	}
	
	@GetMapping("/dislike")
	public String dislike(CommandMap map) {
		boardService.dislike(map.get("bno"));
		
		return "redirect:/detail2.do?bno=" + map.get("bno");
	}
	
}