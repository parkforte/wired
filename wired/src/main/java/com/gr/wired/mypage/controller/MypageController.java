package com.gr.wired.mypage.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	private static final Logger logger
		= LoggerFactory.getLogger(MypageController.class);


	@RequestMapping("/mypage")
	public String mypage() {

		return "mypage/mypage";
	}

	//아래 내용은 팀장이상(결재 서명관리)
	// 유저의 계급을 가져오기
	// 유저의 계급을 jsp로 넘겨주기

}
