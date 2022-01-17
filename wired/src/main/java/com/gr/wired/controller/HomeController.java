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
import com.gr.wired.confirm.model.ConfirmService;

@Controller
public class HomeController {
	private static final Logger logger
	=LoggerFactory.getLogger(HomeController.class);

	private final BdListService bdListService;
	private final BoardService boardService;
	private final ConfirmService confirmService;

	@Autowired
	public HomeController(BdListService bdListService, BoardService boardService, ConfirmService confirmService) {
		super();
		this.bdListService = bdListService;
		this.boardService = boardService;
		this.confirmService = confirmService;
	}


	@RequestMapping("/index")
	public String home(HttpSession session, Model model) {
		int memNo=(int) session.getAttribute("memNo");
		logger.info("게시판 메뉴 메뉴 memNo={}", memNo);

		List<BdListVO> list=bdListService.selectMenu();

		List<Map<String, Object>> noList= boardService.selectMainNotice();
		logger.info("noList.size={}", noList.size());

		int state1=confirmService.countState1(memNo);
		int state2=confirmService.countState2(memNo);
		int state3=confirmService.countState3(memNo);
		int state4=confirmService.countState4(memNo);


		model.addAttribute("state1",state1);
		model.addAttribute("state2",state2);
		model.addAttribute("state3",state3);
		model.addAttribute("state4",state4);

		session.setAttribute("bdlist", list);
		model.addAttribute("noList", noList);

		return "index";
	}





	@RequestMapping("/default/defaultPage")
	public String defaultPage() {
		return "default/defaultPage";
	}

}
