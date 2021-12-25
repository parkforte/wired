package com.gr.wired.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {

	
	@RequestMapping("/boardList")
	public String boardList() {
		//1
		
		//2
		
		//3
		
		//4
		return "board/boardList";
	}
}
