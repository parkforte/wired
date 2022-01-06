package com.gr.wired.confirm.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

	@GetMapping("/docbox")
	public String docbox_get() {
		return "e-approval/docbox";
	}

	@RequestMapping("/confirm/confirmLine")
	public void addConfirmLine() {

	}


	@GetMapping("/signature/paint")
	public String signature_get() {
		return "e-approval/signature/paint";
	}

	@PostMapping("/confirm/searchEmpl")
	public String searchMember(@ModelAttribute EmplVO emplVo, Model model) {
		logger.info("라인등록 사원조회, emplVo={}", emplVo);

		List<Map<String, Object>> emplList=emplService.selectByMemName(emplVo);
		logger.info("사원조회 결과, emplList.size={}", emplList.size());

		model.addAttribute("emplList", emplList);
		logger.info("emplList={}",emplList);

		return "e-approval/confirm/confirmLine";
	}


}
