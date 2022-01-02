package com.gr.wired.doctype.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/e-approval/doctype")
public class DoctypeController {

	private static final Logger logger
		= LoggerFactory.getLogger(DoctypeController.class);

	@GetMapping("/admin")
	public void admin_get() {
		logger.info("문서관리화면!");
	}
	
	@PostMapping("/admin")
	public String add_Doctype(@RequestParam String typeName) {
		logger.info("문서종류추가 파라미터typeName={}", typeName);
		
		//DB
		
		//결과저장
		
		//뷰페이지리턴
		
		return "common/message";
	}
	
	
}
