package com.gr.wired.webHard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/webHard")
public class WebHardController {

	@RequestMapping("/webHardList")
	public String list() {
		
		return "webHard/webHardList";
	}
}
