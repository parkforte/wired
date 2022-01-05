package com.gr.wired.employee.controller;

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

import com.gr.wired.common.ConstUtil;
import com.gr.wired.common.PaginationInfo;
import com.gr.wired.common.SearchVO;
import com.gr.wired.employee.model.EmplService;
import com.gr.wired.employee.model.EmplVO;

@Controller
@RequestMapping("/employee")
public class EmplController {
	private static final Logger logger
	=LoggerFactory.getLogger(EmplController.class);

	private final EmplService emplService;

	@Autowired
	public EmplController(EmplService emplService) {
		this.emplService = emplService;
	}

	@RequestMapping("/emplRegister")
	public void emplInsert() {
		logger.info("사원등록 화면");
	}

	@PostMapping("/emplRegister")
	public String emplJoin(@ModelAttribute EmplVO vo, Model model) {
		logger.info("사원등록 처리, 파라미터 vo={}", vo);

		if(vo.getMemHp2()==null || vo.getMemHp2().isEmpty() || vo.getMemHp3()==null || vo.getMemHp3().isEmpty()) {
			vo.setMemHp1("");
			vo.setMemHp2("");
			vo.setMemHp3("");
		}

		int cnt=emplService.insertEmployee(vo);
		logger.info("사원등록 결과, cnt={}", cnt);

		String msg="사원등록 실패", url="/index";
		if(cnt>0) {
			msg="사원등록 성공";
			url="/employee/emplList";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";

	}

	@RequestMapping("/emplList")
	public String emplAll(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("글목록, 파라미터 searchVo={}", searchVo);

		//[1] PaginationInfo 객체 생성 - 계산해줌
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		//[2] searchVo에 값 셋팅
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("값 셋팅 후 searchVo={}", searchVo);

		List<Map<String, Object>> list=emplService.selectAll(searchVo);
		logger.info("전체조회 결과 list.size={}", list.size());

		//[3] totalRecord 구하기
		int totalRecord=emplService.selectTotalRecord(searchVo);
		pagingInfo.setTotalRecord(totalRecord);

		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);

		return "employee/emplList";
	}

	@RequestMapping("/emplEdit")
	public String emplEdit() {
		return "employee/emplEdit";
	}
	@RequestMapping("/emplResign")
	public String emplquit() {
		return "employee/emplResign";
	}
}
