package com.gr.wired.text.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("test")
public class TextController {
	
	@RequestMapping("/test3")
	public String file() {
		
		return "/test/test3";
	}
}
