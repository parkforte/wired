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
import com.gr.wired.jawon.model.JawonService;
import com.gr.wired.jawon.model.ResTypeVO;

@Controller
public class HomeController {
	private static final Logger logger
	=LoggerFactory.getLogger(HomeController.class);

	private final BdListService bdListService;
	private final JawonService jawonService;

	@Autowired
	public HomeController(BdListService bdListService, JawonService jawonService) {
		super();
		this.bdListService = bdListService;
		this.jawonService = jawonService;
	}

	@RequestMapping("/index")
	public String home(HttpSession session) {
		logger.info("게시판 메뉴 메뉴");
		List<BdListVO> list=bdListService.selectMenu();

		logger.info("nav바 자원 처리");
		List<ResTypeVO> tList=jawonService.selectType();
		logger.info("nav바 자원리스트 결과, tList.size={}", list.size());

		session.setAttribute("bdlist", list);
		session.setAttribute("tList", tList);

		return "index";
	}


	@RequestMapping("/default/defaultPage")
	public String defaultPage() {
		return "default/defaultPage";
	}

}
