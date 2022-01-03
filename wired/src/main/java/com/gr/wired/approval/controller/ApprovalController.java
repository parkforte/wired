package com.gr.wired.approval.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gr.wired.docform.model.DocformService;
import com.gr.wired.docform.model.DocformVO;
import com.gr.wired.doctype.model.DoctypeService;
import com.gr.wired.doctype.model.DoctypeVO;
import com.gr.wired.employee.model.EmplService;

@Controller
@RequestMapping("/e-approval")
public class ApprovalController {

	private static final Logger logger
		= LoggerFactory.getLogger(ApprovalController.class);

	private final DocformService docformService;
	private final DoctypeService doctypeService;
	private final EmplService emplService;

	@Autowired
	public ApprovalController(DocformService docformService, DoctypeService doctypeService, EmplService emplService) {
		super();
		this.docformService = docformService;
		this.doctypeService = doctypeService;
		this.emplService = emplService;
	}

	@GetMapping("/mainpage")
	public String mainpage_get() {
		logger.info("전자결재 메인페이지");
		return "e-approval/mainpage";
	}


	@GetMapping("/paperWrite")
	public String approvalTree_get(HttpSession session, Model model) {
		//memId로 문서작성자 뿌리기
		String memId=(String) session.getAttribute("memId");
		logger.info("전자결재 문서작성페이지, memId={}", memId);

		//양식선택목록
		List<DocformVO> formList=docformService.selectAll();
		logger.info("문서양식 formList.size={}",formList.size());

		List<DoctypeVO> list=doctypeService.selectAll();
		logger.info("문서종류 list.size={}",list.size());

		model.addAttribute("list", list);
		model.addAttribute("formList", formList);

		return "e-approval/paperWrite";
	}

}
