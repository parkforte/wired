package com.gr.wired.confirm.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gr.wired.employee.model.EmplService;
import com.gr.wired.employee.model.EmplVO;

@Controller
@RequestMapping("/e-approval")
public class ConfirmController {

	private static Logger logger = LoggerFactory.getLogger(ConfirmController.class);

	private EmplService emplService;

	@Autowired
	public ConfirmController(EmplService emplService) {
		this.emplService = emplService;
	}

	@RequestMapping("/docbox")
	public void docbox_get() {
		logger.info("문서함!");
	}

	@RequestMapping("/signature/paint")
	public void signature_get() {
		logger.info("서명만들기 화면!");
	}

	@RequestMapping("/confirm/confirmAdmin")
	public void confirmLinePage() {
		logger.info("결재선관리 화면!");
	}

	@PostMapping("/confirm/confirmAdmin")
	public String searchMember(@ModelAttribute EmplVO emplVo, Model model) {
		logger.info("라인등록 사원조회, emplVo={}", emplVo);

		List<Map<String, Object>> emplList=emplService.selectByMemName(emplVo);
		logger.info("사원조회 결과, emplList.size={}", emplList.size());

		model.addAttribute("emplList", emplList);
		logger.info("emplList={}",emplList);

		return "e-approval/confirm/confirmAdmin";
	}

	@PostMapping("/confirm/lineOrder")
	public String addLineOrder(@ModelAttribute EmplVO emplVo, Model model) {
		logger.info("결재순서 등록, emplVo={}", emplVo);

		List<Map<String, Object>> emplList=emplService.selectByMemName(emplVo);
		logger.info("사원조회 결과, emplList.size={}", emplList.size());

		model.addAttribute("emplList", emplList);
		logger.info("emplList={}",emplList);

		return "e-approval/confirm/confirmAdmin";
	}


}
