package com.gr.wired.doctype.controller;

import java.util.List;

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

import com.gr.wired.docform.model.DocformService;
import com.gr.wired.docform.model.DocformVO;
import com.gr.wired.doctype.model.DoctypeService;
import com.gr.wired.doctype.model.DoctypeVO;

@Controller
@RequestMapping("/e-approval/doctype")
public class DoctypeController {

	private static final Logger logger
		= LoggerFactory.getLogger(DoctypeController.class);

	private final DoctypeService doctypeService;
	private final DocformService docformService;

	@Autowired
	public DoctypeController(DoctypeService doctypeService, DocformService docformService) {
		this.doctypeService = doctypeService;
		this.docformService = docformService;
		logger.info("DoctypeController, type, form 생성자주입!");
	}

	@GetMapping("/admin")
	public String admin_get(Model model) {
		logger.info("문서관리화면!");

		List<DoctypeVO> list=doctypeService.selectAll();
		logger.info("문서관리doctype list.size={}", list.size());

		List<DocformVO> formList=docformService.selectAll();
		logger.info("양식관리docform formList.size={}", formList.size());

		model.addAttribute("list", list);
		model.addAttribute("formList", formList);

		return "e-approval/doctype/admin";
	}

	@PostMapping("/addDoc")
	public String add_doctype(@ModelAttribute DoctypeVO vo, Model model) {
		logger.info("문서종류추가 파라미터vo={}", vo);
		//DB
		int result=doctypeService.insertDoctype(vo);
		String msg="데이터를 추가하지 못하였습니다.", url="/e-approval/doctype/admin";
		if(result>0) {
			msg="문서 종류를 추가하였습니다.";
		}
		//결과저장
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		//뷰페이지리턴
		return "common/message";
	}

	@GetMapping("/deleteDoc")
	public String delete_doctype(@RequestParam(defaultValue = "0") int typeNo, Model model) {
		logger.info("문서종류 삭제 파라미터 typeNo={}", typeNo);

		int result=doctypeService.deleteDoctype(typeNo);

		String msg="문서종류 삭제 실패!", url="/e-approval/doctype/admin";
		if(result>0){
			msg="문서종류 삭제 성공!";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	@PostMapping("/addform")
	public String add_form(@ModelAttribute DocformVO vo, Model model) {
		logger.info("문서양식 추가, 파라미터 vo={}", vo);

		int result=docformService.insertDocform(vo);

		String msg="양식 추가 실패!", url="/e-approval/doctype/admin";
		if(result>0) {
			msg="양식 추가 성공!";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	@GetMapping("/deleteForm")
	public String delete_form(@RequestParam(defaultValue = "0") int formNo, Model model) {
		logger.info("문서양식 삭제 파라미터 formNo={}", formNo);

		int result=docformService.deleteDocform(formNo);

		String msg="문서양식 삭제 실패!", url="/e-approval/doctype/admin";
		if(result>0){
			msg="문서양식 삭제 성공!";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}


}
