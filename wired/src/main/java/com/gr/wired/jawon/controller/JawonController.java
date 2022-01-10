package com.gr.wired.jawon.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gr.wired.jawon.model.JawonVO;

@Controller
@RequestMapping("/jawon")
public class JawonController {
	private static final Logger logger
		=LoggerFactory.getLogger(JawonController.class);
//
//	@RequestMapping("/listAdd")
//	public String listAdd(@ModelAttribute JawonVO vo, Model model) {
//		logger.info("자원리스트 등록 처리, 파라미터 vo={}", vo);
//
//
//	}

	@RequestMapping("/jawonList")
	public String list() {
		return "jawon/jawonList";
	}

	@RequestMapping("/jawonManage")
	public String manage() {
		return "jawon/jawonManage";
	}

	@RequestMapping("/jawonInfo")
	public String Info() {
		return "jawon/jawonInfo";
	}

	@RequestMapping("/jawonAllList")
	public String all() {
		return "jawon/jawonAllList";
	}
}
