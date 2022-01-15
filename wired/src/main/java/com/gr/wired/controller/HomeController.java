package com.gr.wired.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gr.wired.bdList.model.BdListService;
import com.gr.wired.bdList.model.BdListVO;
import com.gr.wired.board.model.BoardService;
import com.gr.wired.common.BSearchVO;

@Controller
public class HomeController {
	private static final Logger logger
	=LoggerFactory.getLogger(HomeController.class);

	private final BdListService bdListService;
	private final BoardService boardService;

	@Autowired
	public HomeController(BdListService bdListService, BoardService boardService) {
		super();
		this.bdListService = bdListService;
		this.boardService = boardService;
	}


	@RequestMapping("/index")
	public String home(HttpSession session, Model model) {
		logger.info("게시판 메뉴 메뉴");

		List<BdListVO> list=bdListService.selectMenu();

		List<Map<String, Object>> noList= boardService.selectMainNotice();
		logger.info("noList.size={}", noList.size());


		session.setAttribute("bdlist", list);
		model.addAttribute("noList", noList);

		return "index";
	}


	@RequestMapping("/default/defaultPage")
	public String defaultPage() {
		return "default/defaultPage";
	}

}
