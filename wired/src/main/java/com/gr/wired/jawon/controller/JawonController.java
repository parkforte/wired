package com.gr.wired.jawon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/jawon")
public class JawonController {
	
	@RequestMapping("/jawonList")
	public String list() {
		return "jawon/jawonList";
	}
	
	@RequestMapping("/jawonManage")
	public String manage() {
		return "jawon/jawonManage";
	}
}
