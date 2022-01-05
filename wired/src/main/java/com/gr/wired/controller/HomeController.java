package com.gr.wired.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gr.wired.bdList.model.BdListService;
import com.gr.wired.bdList.model.BdListVO;

@Controller
public class HomeController {
	private static final Logger logger
	=LoggerFactory.getLogger(HomeController.class);

	private final BdListService bdListService;

	@Autowired
	public HomeController(BdListService bdListService) {
		super();
		this.bdListService = bdListService;
	}

	@RequestMapping("/index")
	public String home(HttpSession session) {
		logger.info("게시판 메뉴 메뉴");
		List<BdListVO> list=bdListService.selectMenu();
		session.setAttribute("bdlist", list);
		return "index";
	}

	@RequestMapping("/default/defaultPage")
	public String defaultPage() {
		return "default/defaultPage";
	}

}
