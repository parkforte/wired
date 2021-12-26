package com.gr.wired.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping("/index")
	public String home() {
		return "index";
	}
	
	@RequestMapping("/default/defaultPage")
	public String defaultPage() {
		return "default/defaultPage";
	}
	
	public void test() {
		
	}
}
