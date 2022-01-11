package com.gr.wired.jawon.controller;

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

import com.gr.wired.jawon.model.JawonService;
import com.gr.wired.jawon.model.JawonVO;

@Controller
@RequestMapping("/jawon")
public class JawonController {
	private static final Logger logger
		=LoggerFactory.getLogger(JawonController.class);

	private final JawonService jawonService;

	@Autowired
	public JawonController(JawonService jawonService) {
		this.jawonService = jawonService;
	}

	@RequestMapping("/listAdd")
	public String listAdd(@ModelAttribute JawonVO vo, Model model) {
		logger.info("자원리스트 등록 처리, 파라미터 vo={}", vo);

		int cnt = jawonService.insertJawonList(vo);
		logger.info("자원리스트 등록 결과, cnt={}", cnt);

		String msg="리스트 등록 실패", url="/jawon/jawonManage";
		if(cnt>0) {
			msg="자원리스트 등록 성공";
			url="/jawon/jawonManage";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	@RequestMapping("/jawonManage")
	public String jawonListAll(Model model) {
		logger.info("자원전체목록");

		List<JawonVO> vList=jawonService.selectJawonName();
		logger.info("자원명전체 조회 결과 vList.size={}",vList.size());

		List<Map<String, Object>> list=jawonService.selectJawonAll();
		logger.info("자원전체 조회 결과 list.size={}", list.size());

		model.addAttribute("VList", vList);
		model.addAttribute("list", list);

		return "jawon/jawonManage";
	}

//	@RequestMapping("/jawonSet")
//	public String jawonName(Model model) {
//		logger.info("자원명목록");
//
//		List<JawonVO> vList=jawonService.selectJawonName();
//		logger.info("자원명전체 조회 결과 vList.size={}",vList.size());
//
//		model.addAttribute("vList", vList);
//
//		return "/jawon/jawonSet";
//	}

	@RequestMapping("/jawonList")
	public String list() {
		return "jawon/jawonList";
	}

	@RequestMapping("/jawonReserve")
	public String jReserve() {
		return "jawon/jawonReserve";
	}

	@RequestMapping("/jawonAllList")
	public String all() {
		return "jawon/jawonAllList";
	}
}
