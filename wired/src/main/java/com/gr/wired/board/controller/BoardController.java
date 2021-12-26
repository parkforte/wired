package com.gr.wired.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {

	
	@RequestMapping("/boardList")
	public String list() {
		//1
		
		//2
		
		//3
		
		//4
		return "board/boardList";
	}
	
	@GetMapping("/boardWrite")
	public String write_get() {
		
	
		return "board/boardWrite";
	}
	
	@PostMapping("/boardWrite")
	public String write_post() {
		
		return "redirect:/board/boardList";
	}
	
	@RequestMapping("/boardDetail")
	public String detail() {
		
		return "board/boardDetail";
	}
}
