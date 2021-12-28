package com.gr.wired.commute.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/commute")
public class CommuteController {

	public static final Logger logger
		=LoggerFactory.getLogger(CommuteController.class);
	
	@RequestMapping("/commuteList")
	public String commuteList() {
		
		return "commute/commuteList";
	}
}
